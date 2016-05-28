.class public abstract Lorg/apache/http/params/AbstractHttpParams;
.super Ljava/lang/Object;
.source "AbstractHttpParams.java"

# interfaces
.implements Lorg/apache/http/params/HttpParams;
.implements Lorg/apache/http/params/HttpParamsNames;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method


# virtual methods
.method public getBooleanParameter(Ljava/lang/String;Z)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .prologue
    .line 92
    invoke-virtual {p0, p1}, Lorg/apache/http/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 93
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_7

    .line 96
    .end local v0    # "param":Ljava/lang/Object;
    .end local p2    # "defaultValue":Z
    :goto_6
    return p2

    .restart local v0    # "param":Ljava/lang/Object;
    .restart local p2    # "defaultValue":Z
    :cond_7
    check-cast v0, Ljava/lang/Boolean;

    .end local v0    # "param":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    goto :goto_6
.end method

.method public getDoubleParameter(Ljava/lang/String;D)D
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # D

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lorg/apache/http/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_7

    .line 83
    .end local v0    # "param":Ljava/lang/Object;
    .end local p2    # "defaultValue":D
    :goto_6
    return-wide p2

    .restart local v0    # "param":Ljava/lang/Object;
    .restart local p2    # "defaultValue":D
    :cond_7
    check-cast v0, Ljava/lang/Double;

    .end local v0    # "param":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    goto :goto_6
.end method

.method public getIntParameter(Ljava/lang/String;I)I
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lorg/apache/http/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_7

    .line 70
    .end local v0    # "param":Ljava/lang/Object;
    .end local p2    # "defaultValue":I
    :goto_6
    return p2

    .restart local v0    # "param":Ljava/lang/Object;
    .restart local p2    # "defaultValue":I
    :cond_7
    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "param":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_6
.end method

.method public getLongParameter(Ljava/lang/String;J)J
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/http/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 54
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_7

    .line 57
    .end local v0    # "param":Ljava/lang/Object;
    .end local p2    # "defaultValue":J
    :goto_6
    return-wide p2

    .restart local v0    # "param":Ljava/lang/Object;
    .restart local p2    # "defaultValue":J
    :cond_7
    check-cast v0, Ljava/lang/Long;

    .end local v0    # "param":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    goto :goto_6
.end method

.method public getNames()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isParameterFalse(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 109
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    return v0
.end method

.method public isParameterTrue(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 100
    if-eqz p2, :cond_8

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_4
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 101
    return-object p0

    .line 100
    :cond_8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4
.end method

.method public setDoubleParameter(Ljava/lang/String;D)Lorg/apache/http/params/HttpParams;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 87
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 88
    return-object p0
.end method

.method public setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 74
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 75
    return-object p0
.end method

.method public setLongParameter(Ljava/lang/String;J)Lorg/apache/http/params/HttpParams;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 61
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 62
    return-object p0
.end method
