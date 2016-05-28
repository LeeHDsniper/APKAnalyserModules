.class public Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;
.super Lcom/behance/sdk/exception/BehanceSDKException;
.source "BehanceSDKUserNotEntitledException.java"


# static fields
.field private static final serialVersionUID:J = -0x65cc5bed158cef4L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method
