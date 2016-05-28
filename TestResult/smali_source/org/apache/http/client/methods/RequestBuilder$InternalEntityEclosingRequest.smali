.class Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;
.super Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
.source "RequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/client/methods/RequestBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InternalEntityEclosingRequest"
.end annotation


# instance fields
.field private final method:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 340
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;-><init>()V

    .line 341
    iput-object p1, p0, Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;->method:Ljava/lang/String;

    .line 342
    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lorg/apache/http/client/methods/RequestBuilder$InternalEntityEclosingRequest;->method:Ljava/lang/String;

    return-object v0
.end method
