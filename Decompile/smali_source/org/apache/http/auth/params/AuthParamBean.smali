.class public Lorg/apache/http/auth/params/AuthParamBean;
.super Lorg/apache/http/params/HttpAbstractParamBean;
.source "AuthParamBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/http/params/HttpAbstractParamBean;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 49
    return-void
.end method


# virtual methods
.method public setCredentialCharset(Ljava/lang/String;)V
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/http/auth/params/AuthParamBean;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v0, p1}, Lorg/apache/http/auth/params/AuthParams;->setCredentialCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 53
    return-void
.end method
