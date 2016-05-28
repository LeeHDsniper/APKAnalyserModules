.class public Lorg/apache/http/conn/params/ConnConnectionParamBean;
.super Lorg/apache/http/params/HttpAbstractParamBean;
.source "ConnConnectionParamBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/apache/http/params/HttpAbstractParamBean;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 48
    return-void
.end method


# virtual methods
.method public setMaxStatusLineGarbage(I)V
    .registers 4
    .param p1, "maxStatusLineGarbage"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnConnectionParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.connection.max-status-line-garbage"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 57
    return-void
.end method
