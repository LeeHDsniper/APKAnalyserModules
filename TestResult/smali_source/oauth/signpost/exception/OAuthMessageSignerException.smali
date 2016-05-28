.class public Loauth/signpost/exception/OAuthMessageSignerException;
.super Loauth/signpost/exception/OAuthException;
.source "OAuthMessageSignerException.java"


# direct methods
.method public constructor <init>(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Loauth/signpost/exception/OAuthException;-><init>(Ljava/lang/Throwable;)V

    .line 26
    return-void
.end method
