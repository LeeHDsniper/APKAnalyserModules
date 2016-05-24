.class public Loauth/signpost/exception/OAuthExpectationFailedException;
.super Loauth/signpost/exception/OAuthException;
.source "OAuthExpectationFailedException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Loauth/signpost/exception/OAuthException;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method
