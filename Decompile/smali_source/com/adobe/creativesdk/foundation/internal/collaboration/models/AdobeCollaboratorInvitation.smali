.class public abstract Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
.super Ljava/lang/Object;
.source "AdobeCollaboratorInvitation.java"


# instance fields
.field private isInvite:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getEmail()Ljava/lang/String;
.end method

.method public isInvite()Z
    .registers 2

    .prologue
    .line 12
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;->isInvite:Z

    return v0
.end method

.method public isOwner()Z
    .registers 3

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;->isInvite()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_9

    .line 21
    const/4 v0, 0x0

    .line 23
    .end local p0    # "this":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    :goto_8
    return v0

    .restart local p0    # "this":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    :cond_9
    check-cast p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;

    .end local p0    # "this":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->isOwner()Z

    move-result v0

    goto :goto_8
.end method

.method public setIsInvite(Z)V
    .registers 2
    .param p1, "isInvite"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;->isInvite:Z

    .line 17
    return-void
.end method
