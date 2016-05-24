.class public Lcom/behance/sdk/exception/BehanceSDKException;
.super Ljava/lang/Exception;
.source "BehanceSDKException.java"


# static fields
.field private static final serialVersionUID:J = 0x3de6d3aaec4d8f9eL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 11
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 24
    return-void
.end method
