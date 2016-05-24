.class public Lorg/apache/http/client/HttpResponseException;
.super Lorg/apache/http/client/ClientProtocolException;
.source "HttpResponseException.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x63bc080fd5942acdL


# instance fields
.field private final statusCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "statusCode"    # I
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p2}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    .line 45
    iput p1, p0, Lorg/apache/http/client/HttpResponseException;->statusCode:I

    .line 46
    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lorg/apache/http/client/HttpResponseException;->statusCode:I

    return v0
.end method
