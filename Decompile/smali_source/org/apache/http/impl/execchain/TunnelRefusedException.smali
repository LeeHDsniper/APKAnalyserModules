.class public Lorg/apache/http/impl/execchain/TunnelRefusedException;
.super Lorg/apache/http/HttpException;
.source "TunnelRefusedException.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x77ff549cf91bbbabL


# instance fields
.field private final response:Lorg/apache/http/HttpResponse;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    .line 48
    iput-object p2, p0, Lorg/apache/http/impl/execchain/TunnelRefusedException;->response:Lorg/apache/http/HttpResponse;

    .line 49
    return-void
.end method


# virtual methods
.method public getResponse()Lorg/apache/http/HttpResponse;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/http/impl/execchain/TunnelRefusedException;->response:Lorg/apache/http/HttpResponse;

    return-object v0
.end method
