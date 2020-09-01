graph [
  version 2
  directed 1
  fontname "Roboto"
  fontsize 8
  splines "true"
  node [
    id 0
    name "core_model_utils_AbstractSiteModel"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    AbstractSiteModel
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">domain</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_secure</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    AbstractSiteModel
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">domain</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_secure</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 1
    name "repository_models_Repository"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Repository<BR/>&lt;<FONT FACE="Roboto"><I>AbstractSiteModel</I></FONT>&gt;
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>press</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">about</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">accept_version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">custom_js_code</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">decline</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">decline_version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><I>domain</I></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><I>CharField</I></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><I>is_secure</I></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><I>BooleanField</I></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">limit_upload_to_pdf</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">live</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">logo</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">ImageField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">new_comment</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">object_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">object_name_plural</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">publication</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">publisher</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">random_homepage_preprints</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">short_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">start</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">submission</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Repository<BR/>&lt;<FONT FACE="Roboto"><I>AbstractSiteModel</I></FONT>&gt;
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>press</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">about</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">accept_version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">custom_js_code</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">decline</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">decline_version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><I>domain</I></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><I>CharField</I></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><I>is_secure</I></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><I>BooleanField</I></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">limit_upload_to_pdf</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">live</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">logo</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">ImageField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">new_comment</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">object_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">object_name_plural</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">publication</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">publisher</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">random_homepage_preprints</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">short_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">start</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">submission</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 2
    name "repository_models_RepositoryField"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    RepositoryField
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">choices</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">dc_metadata_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">display</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">help_text</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">input_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">order</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">required</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    RepositoryField
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">choices</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">dc_metadata_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">display</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">help_text</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">input_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">order</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">required</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 3
    name "repository_models_RepositoryFieldAnswer"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    RepositoryFieldAnswer
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>field</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">answer</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    RepositoryFieldAnswer
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>field</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">answer</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 4
    name "repository_models_Preprint"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Preprint
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>license</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>owner</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>submission_file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">abstract</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">comments_editor</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">current_step</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_accepted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_declined</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_published</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_started</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_submitted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_updated</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">doi</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">meta_image</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">ImageField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">preprint_decision_notification</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">stage</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">title</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Preprint
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>license</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>owner</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>submission_file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">abstract</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">comments_editor</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">current_step</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_accepted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_declined</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_published</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_started</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_submitted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_updated</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">doi</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">meta_image</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">ImageField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">preprint_decision_notification</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">stage</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">title</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 5
    name "repository_models_PreprintFile"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintFile
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">file</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">FileField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">mime_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">original_filename</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">size</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">PositiveIntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">uploaded</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintFile
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">file</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">FileField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">mime_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">original_filename</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">size</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">PositiveIntegerField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">uploaded</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 6
    name "repository_models_PreprintAccess"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintAccess
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>country</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">accessed</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">identifier</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintAccess
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>country</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">accessed</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">identifier</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 7
    name "repository_models_PreprintAuthor"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintAuthor
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>author</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">order</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">PositiveIntegerField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintAuthor
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>author</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">order</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">PositiveIntegerField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 8
    name "repository_models_Author"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Author
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">affiliation</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">email_address</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">EmailField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">first_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">last_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">middle_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">orcid</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Author
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">affiliation</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">email_address</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">EmailField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">first_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">last_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">middle_name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">orcid</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 9
    name "repository_models_PreprintVersion"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintVersion
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>moderated_version</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_time</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    PreprintVersion
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>moderated_version</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_time</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">version</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">IntegerField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 10
    name "repository_models_Comment"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Comment
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>author</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>reply_to</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">body</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_time</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_public</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_reviewed</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Comment
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>author</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>reply_to</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">body</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">TextField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_time</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_public</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">is_reviewed</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 11
    name "repository_models_Subject"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Subject
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>parent</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">enabled</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">slug</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">SlugField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    Subject
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>parent</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>repository</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">enabled</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">name</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">slug</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">SlugField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 12
    name "repository_models_VersionQueue"
    label "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    VersionQueue
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">approved</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_decision</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_submitted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">update_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
    <TABLE BGCOLOR="white" BORDER="1" CELLBORDER="0" CELLSPACING="0">
    <TR><TD COLSPAN="2" CELLPADDING="5" ALIGN="CENTER" BGCOLOR="#1b563f">
    <FONT FACE="Roboto" COLOR="white" POINT-SIZE="10"><B>
    VersionQueue
    </B></FONT></TD></TR>
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>id</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>AutoField</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>file</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto"><B>preprint</B></FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto"><B>ForeignKey (id)</B></FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">approved</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">BooleanField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT COLOR="#7B7B7B" FACE="Roboto">date_decision</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT COLOR="#7B7B7B" FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">date_submitted</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">DateTimeField</FONT>
    </TD></TR>
  
  
  
    <TR><TD ALIGN="LEFT" BORDER="0">
    <FONT FACE="Roboto">update_type</FONT>
    </TD><TD ALIGN="LEFT">
    <FONT FACE="Roboto">CharField</FONT>
    </TD></TR>
  
  
    </TABLE>
    "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 13
    name "press_models_Press"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Press</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Press</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 14
    name "core_models_Account"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Account</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Account</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 15
    name "submission_models_Article"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Article</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Article</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 16
    name "submission_models_Licence"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Licence</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Licence</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 17
    name "submission_models_Keyword"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Keyword</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Keyword</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  node [
    id 18
    name "core_models_Country"
    label "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Country</FONT>
  </TD></TR>
  </TABLE>
  "
    graphics [
      type "plaintext"
    ]
    LabelGraphics [
      text "
  <TABLE BGCOLOR="white" BORDER="0" CELLBORDER="0" CELLSPACING="0">
  <TR><TD COLSPAN="2" CELLPADDING="4" ALIGN="CENTER" BGCOLOR="#1b563f">
  <FONT FACE="Roboto" POINT-SIZE="12" COLOR="white">Country</FONT>
  </TD></TR>
  </TABLE>
  "
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 1
    source 1
    target 13
    label " press (repository)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " press (repository)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 2
    source 1
    target 14
    label " managers (repository)"
    graphics [
      targetArrow "dot"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " managers (repository)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 3
    source 1
    target 15
    label " homepage_preprints (repository)"
    graphics [
      targetArrow "dot"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " homepage_preprints (repository)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 4
    source 2
    target 1
    label " repository (repositoryfield)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " repository (repositoryfield)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 5
    source 3
    target 2
    label " field (repositoryfieldanswer)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " field (repositoryfieldanswer)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 6
    source 3
    target 4
    label " preprint (repositoryfieldanswer)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (repositoryfieldanswer)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 7
    source 4
    target 1
    label " repository (preprint)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " repository (preprint)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 9
    source 4
    target 5
    label " submission_file (submission_file)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " submission_file (submission_file)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 11
    source 4
    target 11
    label " subject (preprint)"
    graphics [
      targetArrow "dot"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " subject (preprint)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 8
    source 4
    target 14
    label " owner (preprint)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " owner (preprint)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 10
    source 4
    target 16
    label " license (preprint)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " license (preprint)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 12
    source 4
    target 17
    label " keywords (preprint)"
    graphics [
      targetArrow "dot"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " keywords (preprint)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 13
    source 5
    target 4
    label " preprint (preprintfile)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (preprintfile)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 14
    source 6
    target 4
    label " preprint (preprintaccess)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (preprintaccess)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 15
    source 6
    target 5
    label " file (preprintaccess)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " file (preprintaccess)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 16
    source 6
    target 18
    label " country (preprintaccess)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " country (preprintaccess)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 17
    source 7
    target 4
    label " preprint (preprintauthor)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (preprintauthor)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 18
    source 7
    target 8
    label " author (preprintauthor)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " author (preprintauthor)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 19
    source 9
    target 4
    label " preprint (preprintversion)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (preprintversion)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 20
    source 9
    target 5
    label " file (preprintversion)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " file (preprintversion)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 21
    source 9
    target 12
    label " moderated_version (preprintversion)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " moderated_version (preprintversion)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 23
    source 10
    target 4
    label " preprint (comment)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (comment)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 24
    source 10
    target 10
    label " reply_to (comment)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " reply_to (comment)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 22
    source 10
    target 14
    label " author (comment)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " author (comment)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 25
    source 11
    target 1
    label " repository (subject)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " repository (subject)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 26
    source 11
    target 11
    label " parent (children)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " parent (children)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 27
    source 11
    target 14
    label " editors (subject)"
    graphics [
      targetArrow "dot"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " editors (subject)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 28
    source 12
    target 4
    label " preprint (versionqueue)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " preprint (versionqueue)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
  edge [
    id 29
    source 12
    target 5
    label " file (versionqueue)"
    graphics [
      targetArrow "none"
      sourceArrow "dot"
      arrow "both"
    ]
    LabelGraphics [
      text " file (versionqueue)"
      fontSize 8
      fontName "Roboto"
    ]
  ]
]
