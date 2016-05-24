.class Lorg/apache/http/impl/cookie/BrowserCompatSpec$1;
.super Lorg/apache/http/impl/cookie/BasicPathHandler;
.source "BrowserCompatSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/cookie/BrowserCompatSpec;-><init>([Ljava/lang/String;Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory$SecurityLevel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/cookie/BrowserCompatSpec;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/cookie/BrowserCompatSpec;)V
    .registers 2

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BrowserCompatSpec$1;->this$0:Lorg/apache/http/impl/cookie/BrowserCompatSpec;

    invoke-direct {p0}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .registers 3
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "origin"    # Lorg/apache/http/cookie/CookieOrigin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 99
    return-void
.end method
