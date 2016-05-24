.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
.super Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
.source "AdobeCollaborationInvite.java"


# instance fields
.field private _createdDate:Ljava/lang/String;

.field private _inviteID:Ljava/lang/String;

.field private _recipientEmail:Ljava/lang/String;

.field private _resourceName:Ljava/lang/String;

.field private _senderUserName:Ljava/lang/String;

.field private isInProgressMode:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->isInProgressMode:Z

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setIsInvite(Z)V

    .line 18
    return-void
.end method

.method public static inviteWithDictionary(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    .registers 6
    .param p0, "invitationData"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 34
    :try_start_1
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;-><init>()V

    .line 35
    .local v2, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    const-string v4, "id"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setInviteID(Ljava/lang/String;)V

    .line 36
    const-string v4, "resourceName"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setResourceName(Ljava/lang/String;)V
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_18} :catch_48

    .line 38
    :try_start_18
    const-string v4, "senderName"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setSenderUserName(Ljava/lang/String;)V
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_21} :catch_34

    .line 52
    :goto_21
    :try_start_21
    const-string v4, "created"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setCreatedDate(Ljava/lang/String;)V
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_2a} :catch_48

    .line 55
    :try_start_2a
    const-string v4, "recipientEmail"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setEmail(Ljava/lang/String;)V
    :try_end_33
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_33} :catch_4b

    .line 65
    .end local v2    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    :goto_33
    return-object v2

    .line 40
    .restart local v2    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    :catch_34
    move-exception v1

    .line 42
    .local v1, "exp":Lorg/json/JSONException;
    const/4 v4, 0x0

    :try_start_36
    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setSenderUserName(Ljava/lang/String;)V
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_39} :catch_48

    .line 45
    :try_start_39
    const-string v4, "senderLastName"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setSenderUserName(Ljava/lang/String;)V
    :try_end_42
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_42} :catch_43

    goto :goto_21

    .line 47
    :catch_43
    move-exception v0

    .line 49
    .local v0, "e":Lorg/json/JSONException;
    :try_start_44
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_21

    .line 63
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "exp":Lorg/json/JSONException;
    .end local v2    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    :catch_48
    move-exception v1

    .restart local v1    # "exp":Lorg/json/JSONException;
    move-object v2, v3

    .line 65
    goto :goto_33

    .line 57
    .end local v1    # "exp":Lorg/json/JSONException;
    .restart local v2    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    :catch_4b
    move-exception v0

    .line 59
    .restart local v0    # "e":Lorg/json/JSONException;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->setEmail(Ljava/lang/String;)V
    :try_end_50
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_50} :catch_48

    goto :goto_33
.end method


# virtual methods
.method public getEmail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_recipientEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getInviteID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_inviteID:Ljava/lang/String;

    return-object v0
.end method

.method public getResourceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_resourceName:Ljava/lang/String;

    return-object v0
.end method

.method public getSenderUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_senderUserName:Ljava/lang/String;

    return-object v0
.end method

.method public setCreatedDate(Ljava/lang/String;)V
    .registers 2
    .param p1, "createdDate"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_createdDate:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .registers 2
    .param p1, "recipientEmail"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_recipientEmail:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setInviteID(Ljava/lang/String;)V
    .registers 2
    .param p1, "inviteID"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_inviteID:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setResourceName(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_resourceName:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setSenderUserName(Ljava/lang/String;)V
    .registers 2
    .param p1, "senderUserName"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->_senderUserName:Ljava/lang/String;

    .line 83
    return-void
.end method
