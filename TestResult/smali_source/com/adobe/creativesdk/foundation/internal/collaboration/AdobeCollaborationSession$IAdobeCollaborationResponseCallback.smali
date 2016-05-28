.class interface abstract Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "IAdobeCollaborationResponseCallback"
.end annotation


# virtual methods
.method public abstract onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end method

.method public abstract onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
.end method
