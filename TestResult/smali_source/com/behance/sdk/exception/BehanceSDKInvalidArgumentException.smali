.class public Lcom/behance/sdk/exception/BehanceSDKInvalidArgumentException;
.super Lcom/behance/sdk/exception/BehanceSDKException;
.source "BehanceSDKInvalidArgumentException.java"


# static fields
.field private static final serialVersionUID:J = 0x6728a361675cdca5L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    .line 12
    return-void
.end method
