.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
.super Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
.source "AdobeCollaborator.java"


# instance fields
.field private _email:Ljava/lang/String;

.field private _name:Ljava/lang/String;

.field private _owner:Z

.field private _userID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;-><init>()V

    .line 15
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setIsInvite(Z)V

    .line 16
    return-void
.end method


# virtual methods
.method public getEmail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_email:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_userID:Ljava/lang/String;

    return-object v0
.end method

.method public isOwner()Z
    .registers 2

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_owner:Z

    return v0
.end method

.method public setEmail(Ljava/lang/String;)V
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_email:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_name:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setOwner(Z)V
    .registers 2
    .param p1, "owner"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_owner:Z

    .line 48
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "userID"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->_userID:Ljava/lang/String;

    .line 44
    return-void
.end method
