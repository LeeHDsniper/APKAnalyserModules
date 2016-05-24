.class public Lorg/apache/http/impl/client/ClientParamsStack;
.super Lorg/apache/http/params/AbstractHttpParams;
.source "ClientParamsStack.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final applicationParams:Lorg/apache/http/params/HttpParams;

.field protected final clientParams:Lorg/apache/http/params/HttpParams;

.field protected final overrideParams:Lorg/apache/http/params/HttpParams;

.field protected final requestParams:Lorg/apache/http/params/HttpParams;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/ClientParamsStack;)V
    .registers 6
    .param p1, "stack"    # Lorg/apache/http/impl/client/ClientParamsStack;

    .prologue
    .line 116
    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getApplicationParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getClientParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getRequestParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getOverrideParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/apache/http/impl/client/ClientParamsStack;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/ClientParamsStack;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "stack"    # Lorg/apache/http/impl/client/ClientParamsStack;
    .param p2, "aparams"    # Lorg/apache/http/params/HttpParams;
    .param p3, "cparams"    # Lorg/apache/http/params/HttpParams;
    .param p4, "rparams"    # Lorg/apache/http/params/HttpParams;
    .param p5, "oparams"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 139
    if-eqz p2, :cond_c

    .end local p2    # "aparams":Lorg/apache/http/params/HttpParams;
    :goto_2
    if-eqz p3, :cond_11

    .end local p3    # "cparams":Lorg/apache/http/params/HttpParams;
    :goto_4
    if-eqz p4, :cond_16

    .end local p4    # "rparams":Lorg/apache/http/params/HttpParams;
    :goto_6
    if-eqz p5, :cond_1b

    .end local p5    # "oparams":Lorg/apache/http/params/HttpParams;
    :goto_8
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/apache/http/impl/client/ClientParamsStack;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    .line 143
    return-void

    .line 139
    .restart local p2    # "aparams":Lorg/apache/http/params/HttpParams;
    .restart local p3    # "cparams":Lorg/apache/http/params/HttpParams;
    .restart local p4    # "rparams":Lorg/apache/http/params/HttpParams;
    .restart local p5    # "oparams":Lorg/apache/http/params/HttpParams;
    :cond_c
    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getApplicationParams()Lorg/apache/http/params/HttpParams;

    move-result-object p2

    goto :goto_2

    .end local p2    # "aparams":Lorg/apache/http/params/HttpParams;
    :cond_11
    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getClientParams()Lorg/apache/http/params/HttpParams;

    move-result-object p3

    goto :goto_4

    .end local p3    # "cparams":Lorg/apache/http/params/HttpParams;
    :cond_16
    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getRequestParams()Lorg/apache/http/params/HttpParams;

    move-result-object p4

    goto :goto_6

    .end local p4    # "rparams":Lorg/apache/http/params/HttpParams;
    :cond_1b
    invoke-virtual {p1}, Lorg/apache/http/impl/client/ClientParamsStack;->getOverrideParams()Lorg/apache/http/params/HttpParams;

    move-result-object p5

    goto :goto_8
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V
    .registers 5
    .param p1, "aparams"    # Lorg/apache/http/params/HttpParams;
    .param p2, "cparams"    # Lorg/apache/http/params/HttpParams;
    .param p3, "rparams"    # Lorg/apache/http/params/HttpParams;
    .param p4, "oparams"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/apache/http/params/AbstractHttpParams;-><init>()V

    .line 101
    iput-object p1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->applicationParams:Lorg/apache/http/params/HttpParams;

    .line 102
    iput-object p2, p0, Lorg/apache/http/impl/client/ClientParamsStack;->clientParams:Lorg/apache/http/params/HttpParams;

    .line 103
    iput-object p3, p0, Lorg/apache/http/impl/client/ClientParamsStack;->requestParams:Lorg/apache/http/params/HttpParams;

    .line 104
    iput-object p4, p0, Lorg/apache/http/impl/client/ClientParamsStack;->overrideParams:Lorg/apache/http/params/HttpParams;

    .line 105
    return-void
.end method


# virtual methods
.method public copy()Lorg/apache/http/params/HttpParams;
    .registers 1

    .prologue
    .line 265
    return-object p0
.end method

.method public final getApplicationParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/http/impl/client/ClientParamsStack;->applicationParams:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method public final getClientParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/http/impl/client/ClientParamsStack;->clientParams:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method public final getOverrideParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/http/impl/client/ClientParamsStack;->overrideParams:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 193
    const-string v1, "Parameter name"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 195
    const/4 v0, 0x0

    .line 197
    .local v0, "result":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->overrideParams:Lorg/apache/http/params/HttpParams;

    if-eqz v1, :cond_10

    .line 198
    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->overrideParams:Lorg/apache/http/params/HttpParams;

    invoke-interface {v1, p1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 200
    .end local v0    # "result":Ljava/lang/Object;
    :cond_10
    if-nez v0, :cond_1c

    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->requestParams:Lorg/apache/http/params/HttpParams;

    if-eqz v1, :cond_1c

    .line 201
    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->requestParams:Lorg/apache/http/params/HttpParams;

    invoke-interface {v1, p1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 203
    :cond_1c
    if-nez v0, :cond_28

    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->clientParams:Lorg/apache/http/params/HttpParams;

    if-eqz v1, :cond_28

    .line 204
    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->clientParams:Lorg/apache/http/params/HttpParams;

    invoke-interface {v1, p1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 206
    :cond_28
    if-nez v0, :cond_34

    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->applicationParams:Lorg/apache/http/params/HttpParams;

    if-eqz v1, :cond_34

    .line 207
    iget-object v1, p0, Lorg/apache/http/impl/client/ClientParamsStack;->applicationParams:Lorg/apache/http/params/HttpParams;

    invoke-interface {v1, p1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 209
    :cond_34
    return-object v0
.end method

.method public final getRequestParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/http/impl/client/ClientParamsStack;->requestParams:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method public removeParameter(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 246
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing parameters in a stack is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting parameters in a stack is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
