.class Lorg/apache/http/cookie/CookieSpecRegistry$1;
.super Ljava/lang/Object;
.source "CookieSpecRegistry.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpecProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/cookie/CookieSpecRegistry;->lookup(Ljava/lang/String;)Lorg/apache/http/cookie/CookieSpecProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/cookie/CookieSpecRegistry;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/http/cookie/CookieSpecRegistry;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 156
    iput-object p1, p0, Lorg/apache/http/cookie/CookieSpecRegistry$1;->this$0:Lorg/apache/http/cookie/CookieSpecRegistry;

    iput-object p2, p0, Lorg/apache/http/cookie/CookieSpecRegistry$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;
    .registers 6
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 159
    const-string v1, "http.request"

    invoke-interface {p1, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpRequest;

    .line 161
    .local v0, "request":Lorg/apache/http/HttpRequest;
    iget-object v1, p0, Lorg/apache/http/cookie/CookieSpecRegistry$1;->this$0:Lorg/apache/http/cookie/CookieSpecRegistry;

    iget-object v2, p0, Lorg/apache/http/cookie/CookieSpecRegistry$1;->val$name:Ljava/lang/String;

    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v1

    return-object v1
.end method
