.class public Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;
.super Loauth/signpost/AbstractOAuthConsumer;
.source "CommonsHttpOAuthConsumer.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "consumerKey"    # Ljava/lang/String;
    .param p2, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Loauth/signpost/AbstractOAuthConsumer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method protected wrap(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;
    .registers 5
    .param p1, "request"    # Ljava/lang/Object;

    .prologue
    .line 35
    instance-of v0, p1, Lorg/apache/http/HttpRequest;

    if-nez v0, :cond_23

    .line 36
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "This consumer expects requests of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lorg/apache/http/HttpRequest;

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_23
    new-instance v0, Loauth/signpost/commonshttp/HttpRequestAdapter;

    check-cast p1, Lorg/apache/http/client/methods/HttpUriRequest;

    .end local p1    # "request":Ljava/lang/Object;
    invoke-direct {v0, p1}, Loauth/signpost/commonshttp/HttpRequestAdapter;-><init>(Lorg/apache/http/client/methods/HttpUriRequest;)V

    return-object v0
.end method
