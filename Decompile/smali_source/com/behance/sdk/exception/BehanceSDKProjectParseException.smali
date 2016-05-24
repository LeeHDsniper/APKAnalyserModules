.class public Lcom/behance/sdk/exception/BehanceSDKProjectParseException;
.super Ljava/lang/Exception;
.source "BehanceSDKProjectParseException.java"


# static fields
.field private static final serialVersionUID:J = 0x2dcdb50d08952a96L


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    return-void
.end method
