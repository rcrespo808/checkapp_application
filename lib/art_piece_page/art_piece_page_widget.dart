import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtPiecePageWidget extends StatefulWidget {
  const ArtPiecePageWidget({
    Key key,
    this.artPiece,
  }) : super(key: key);

  final dynamic artPiece;

  @override
  _ArtPiecePageWidgetState createState() => _ArtPiecePageWidgetState();
}

class _ArtPiecePageWidgetState extends State<ArtPiecePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final artPiecePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              getJsonField(
                widget.artPiece,
                r'''$.title''',
              ).toString(),
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Playfair Display',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              ToggleIcon(
                onPressed: () async {
                  final favoritesElement = getJsonField(
                    widget.artPiece,
                    r'''$.objectID''',
                  );
                  final favoritesUpdate = artPiecePageUsersRecord.favorites
                          .toList()
                          .contains(favoritesElement)
                      ? FieldValue.arrayRemove([favoritesElement])
                      : FieldValue.arrayUnion([favoritesElement]);
                  final usersUpdateData = {
                    'favorites': favoritesUpdate,
                  };
                  await artPiecePageUsersRecord.reference
                      .update(usersUpdateData);
                },
                value: artPiecePageUsersRecord.favorites
                    .toList()
                    .contains(getJsonField(
                      widget.artPiece,
                      r'''$.objectID''',
                    )),
                onIcon: Icon(
                  Icons.favorite,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 25,
                ),
                offIcon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 25,
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.network(
                          getJsonField(
                            widget.artPiece,
                            r'''$.primaryImage''',
                          ),
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getJsonField(
                                  widget.artPiece,
                                  r'''$.title''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Playfair Display',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 6, 0),
                                      child: Text(
                                        getJsonField(
                                          widget.artPiece,
                                          r'''$.artistDisplayName''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Playfair Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AutoSizeText(
                                        getJsonField(
                                          widget.artPiece,
                                          r'''$.artistDisplayName''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  Text(
                                    'Title',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Playfair Display',
                                          color: Color(0xFF1E2429),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Playfair Display',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  Text(
                                    'Maker',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Playfair Display',
                                          color: Color(0xFF1E2429),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.artistDisplayName''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Playfair Display',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  Text(
                                    'Department',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Playfair Display',
                                          color: Color(0xFF1E2429),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.department''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Playfair Display',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  Text(
                                    'Accesion Number',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Playfair Display',
                                          color: Color(0xFF1E2429),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.accessionNumber''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Playfair Display',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 20),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(getJsonField(
                                        widget.artPiece,
                                        r'''$.objectURL''',
                                      ).toString());
                                    },
                                    child: Text(
                                      'View on Met Website',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Playfair Display',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 84,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final usersUpdateData = {
                          'favorites': FieldValue.arrayUnion([
                            getJsonField(
                              widget.artPiece,
                              r'''$.objectID''',
                            )
                          ]),
                        };
                        await currentUserReference.update(usersUpdateData);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'MyCollection'),
                          ),
                        );
                      },
                      text: 'Add to Collection',
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
