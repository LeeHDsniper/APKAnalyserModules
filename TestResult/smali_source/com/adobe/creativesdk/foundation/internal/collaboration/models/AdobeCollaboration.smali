.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
.super Ljava/lang/Object;
.source "AdobeCollaboration.java"


# static fields
.field private static _collaborators:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;",
            ">;"
        }
    .end annotation
.end field

.field private static _invites:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;",
            ">;"
        }
    .end annotation
.end field

.field private static _invitesCollaborators:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;",
            ">;"
        }
    .end annotation
.end field

.field private static _ownerId:Ljava/lang/String;

.field private static _selfAdobeID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_selfAdobeID:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_ownerId:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_collaborators:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invites:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    .line 26
    return-void
.end method

.method public static collaborationWithDictionary(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
    .registers 15
    .param p0, "collaborationData"    # Lorg/json/JSONObject;

    .prologue
    .line 41
    if-nez p0, :cond_4

    .line 42
    const/4 v0, 0x0

    .line 97
    :cond_3
    :goto_3
    return-object v0

    .line 45
    :cond_4
    :try_start_4
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;-><init>()V

    .line 46
    .local v0, "collaboration":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
    const/4 v9, -0x1

    .line 47
    .local v9, "ownerpos":I
    const/4 v11, -0x1

    .line 48
    .local v11, "selfpos":I
    const-string v12, "ownerId"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    sput-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_ownerId:Ljava/lang/String;

    .line 49
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->getSelfAdobeID()Ljava/lang/String;

    move-result-object v10

    .line 50
    .local v10, "selfAdobeID":Ljava/lang/String;
    const-string v12, "collaborators"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 51
    .local v3, "collaborators":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1e
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v5, v12, :cond_85

    .line 53
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 54
    .local v2, "collaboratorData":Lorg/json/JSONObject;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;-><init>()V

    .line 55
    .local v1, "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
    const-string v12, "email"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setEmail(Ljava/lang/String;)V

    .line 56
    const-string v12, "name"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setName(Ljava/lang/String;)V

    .line 57
    const-string v12, "userId"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setUserId(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->getUserID()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_ownerId:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_83

    const/4 v12, 0x1

    :goto_55
    invoke-virtual {v1, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setOwner(Z)V

    .line 59
    const/4 v12, -0x1

    if-ne v9, v12, :cond_68

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->getUserID()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_ownerId:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_68

    .line 60
    move v9, v5

    .line 61
    :cond_68
    const/4 v12, -0x1

    if-ne v11, v12, :cond_76

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->getUserID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_76

    .line 62
    move v11, v5

    .line 63
    :cond_76
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_collaborators:Ljava/util/ArrayList;

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    .line 58
    :cond_83
    const/4 v12, 0x0

    goto :goto_55

    .line 67
    .end local v1    # "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
    .end local v2    # "collaboratorData":Lorg/json/JSONObject;
    :cond_85
    const/4 v12, -0x1

    if-eq v9, v12, :cond_a7

    const/4 v12, -0x1

    if-eq v11, v12, :cond_a7

    .line 68
    if-eqz v9, :cond_9f

    .line 69
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    const/4 v13, 0x0

    invoke-static {v12, v13, v9}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 70
    if-nez v11, :cond_9f

    .line 71
    move v11, v9

    .line 72
    const/4 v12, 0x1

    if-eq v11, v12, :cond_9f

    .line 73
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    const/4 v13, 0x1

    invoke-static {v12, v13, v11}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 76
    :cond_9f
    if-eq v11, v9, :cond_a7

    .line 77
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    const/4 v13, 0x1

    invoke-static {v12, v13, v11}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 79
    :cond_a7
    const-string v12, "invites"

    invoke-virtual {p0, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 80
    .local v7, "invites":Lorg/json/JSONArray;
    const/4 v5, 0x0

    :goto_ae
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v5, v12, :cond_3

    .line 82
    invoke-virtual {v7, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 83
    .local v8, "invitesData":Lorg/json/JSONObject;
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    invoke-direct {v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;-><init>()V

    .line 84
    .local v6, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    const-string v12, "created"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setCreatedDate(Ljava/lang/String;)V

    .line 85
    const-string v12, "id"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setInviteID(Ljava/lang/String;)V

    .line 86
    const-string v12, "senderName"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setSenderUserName(Ljava/lang/String;)V

    .line 87
    const-string v12, "recipientEmail"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setEmail(Ljava/lang/String;)V

    .line 88
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invites:Ljava/util/ArrayList;

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_eb
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_eb} :catch_ee

    .line 80
    add-int/lit8 v5, v5, 0x1

    goto :goto_ae

    .line 93
    .end local v0    # "collaboration":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;
    .end local v3    # "collaborators":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v6    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    .end local v7    # "invites":Lorg/json/JSONArray;
    .end local v8    # "invitesData":Lorg/json/JSONObject;
    .end local v9    # "ownerpos":I
    .end local v10    # "selfAdobeID":Ljava/lang/String;
    .end local v11    # "selfpos":I
    :catch_ee
    move-exception v4

    .line 95
    .local v4, "exp":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 97
    const/4 v0, 0x0

    goto/16 :goto_3
.end method

.method private static getSelfAdobeID()Ljava/lang/String;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_selfAdobeID:Ljava/lang/String;

    if-nez v0, :cond_12

    .line 31
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_selfAdobeID:Ljava/lang/String;

    .line 33
    :cond_12
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_selfAdobeID:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getCollaboratorsAndInvites()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->_invitesCollaborators:Ljava/util/ArrayList;

    return-object v0
.end method
