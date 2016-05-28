.class public Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
.super Lcom/behance/sdk/exception/BehanceSDKException;
.source "BehanceSDKUserNotAuthenticatedException.java"


# static fields
.field private static final serialVersionUID:J = 0x7c2fcc4bbfabbd26L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    .line 13
    return-void
.end method
