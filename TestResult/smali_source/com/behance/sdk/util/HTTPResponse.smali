.class public Lcom/behance/sdk/util/HTTPResponse;
.super Ljava/lang/Object;
.source "HTTPResponse.java"


# instance fields
.field private reasonPhrase:Ljava/lang/String;

.field private responseCode:I

.field private responseString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getReasonPhrase()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/behance/sdk/util/HTTPResponse;->reasonPhrase:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/behance/sdk/util/HTTPResponse;->responseString:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()I
    .registers 2

    .prologue
    .line 50
    iget v0, p0, Lcom/behance/sdk/util/HTTPResponse;->responseCode:I

    return v0
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 2
    .param p1, "reasonPhrase"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/behance/sdk/util/HTTPResponse;->reasonPhrase:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setResponseString(Ljava/lang/String;)V
    .registers 2
    .param p1, "responseString"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/behance/sdk/util/HTTPResponse;->responseString:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setStatusCode(I)V
    .registers 2
    .param p1, "responseCode"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/behance/sdk/util/HTTPResponse;->responseCode:I

    .line 58
    return-void
.end method
