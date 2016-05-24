.class public Lorg/apache/http/impl/cookie/BasicCommentHandler;
.super Lorg/apache/http/impl/cookie/AbstractCookieAttributeHandler;
.source "BasicCommentHandler.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/AbstractCookieAttributeHandler;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V
    .registers 4
    .param p1, "cookie"    # Lorg/apache/http/cookie/SetCookie;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 47
    const-string v0, "Cookie"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    invoke-interface {p1, p2}, Lorg/apache/http/cookie/SetCookie;->setComment(Ljava/lang/String;)V

    .line 49
    return-void
.end method
