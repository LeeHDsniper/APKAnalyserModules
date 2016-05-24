.class public final Lorg/apache/http/conn/scheme/Scheme;
.super Ljava/lang/Object;
.source "Scheme.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final defaultPort:I

.field private final layered:Z

.field private final name:Ljava/lang/String;

.field private final socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

.field private stringRep:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILorg/apache/http/conn/scheme/SchemeSocketFactory;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "factory"    # Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    const-string v0, "Scheme name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    if-lez p2, :cond_2f

    const v0, 0xffff

    if-gt p2, v0, :cond_2f

    move v0, v1

    :goto_12
    const-string v3, "Port is invalid"

    invoke-static {v0, v3}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 92
    const-string v0, "Socket factory"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    .line 94
    iput p2, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    .line 95
    instance-of v0, p3, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;

    if-eqz v0, :cond_31

    .line 96
    iput-boolean v1, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    .line 97
    iput-object p3, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    .line 105
    .end local p3    # "factory":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :goto_2e
    return-void

    .restart local p3    # "factory":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_2f
    move v0, v2

    .line 91
    goto :goto_12

    .line 98
    :cond_31
    instance-of v0, p3, Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    if-eqz v0, :cond_41

    .line 99
    iput-boolean v1, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    .line 100
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor2;

    check-cast p3, Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    .end local p3    # "factory":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    invoke-direct {v0, p3}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor2;-><init>(Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;)V

    iput-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    goto :goto_2e

    .line 102
    .restart local p3    # "factory":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_41
    iput-boolean v2, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    .line 103
    iput-object p3, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    goto :goto_2e
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "factory"    # Lorg/apache/http/conn/scheme/SocketFactory;
    .param p3, "port"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    const-string v0, "Scheme name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    const-string v0, "Socket factory"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    if-lez p3, :cond_36

    const v0, 0xffff

    if-gt p3, v0, :cond_36

    move v0, v1

    :goto_17
    const-string v3, "Port is invalid"

    invoke-static {v0, v3}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 129
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    .line 130
    instance-of v0, p2, Lorg/apache/http/conn/scheme/LayeredSocketFactory;

    if-eqz v0, :cond_38

    .line 131
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor;

    check-cast p2, Lorg/apache/http/conn/scheme/LayeredSocketFactory;

    .end local p2    # "factory":Lorg/apache/http/conn/scheme/SocketFactory;
    invoke-direct {v0, p2}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/LayeredSocketFactory;)V

    iput-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    .line 133
    iput-boolean v1, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    .line 138
    :goto_33
    iput p3, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    .line 139
    return-void

    .restart local p2    # "factory":Lorg/apache/http/conn/scheme/SocketFactory;
    :cond_36
    move v0, v2

    .line 127
    goto :goto_17

    .line 135
    :cond_38
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;

    invoke-direct {v0, p2}, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/SocketFactory;)V

    iput-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    .line 136
    iput-boolean v2, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    goto :goto_33
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 238
    if-ne p0, p1, :cond_5

    .line 247
    :cond_4
    :goto_4
    return v1

    .line 241
    :cond_5
    instance-of v3, p1, Lorg/apache/http/conn/scheme/Scheme;

    if-eqz v3, :cond_24

    move-object v0, p1

    .line 242
    check-cast v0, Lorg/apache/http/conn/scheme/Scheme;

    .line 243
    .local v0, "that":Lorg/apache/http/conn/scheme/Scheme;
    iget-object v3, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    iget v3, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    iget v4, v0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    if-ne v3, v4, :cond_22

    iget-boolean v3, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    iget-boolean v4, v0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    if-eq v3, v4, :cond_4

    :cond_22
    move v1, v2

    goto :goto_4

    .end local v0    # "that":Lorg/apache/http/conn/scheme/Scheme;
    :cond_24
    move v1, v2

    .line 247
    goto :goto_4
.end method

.method public final getDefaultPort()I
    .registers 2

    .prologue
    .line 147
    iget v0, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    return-object v0
.end method

.method public final getSocketFactory()Lorg/apache/http/conn/scheme/SocketFactory;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    instance-of v0, v0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;

    if-eqz v0, :cond_f

    .line 163
    iget-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    check-cast v0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;

    invoke-virtual {v0}, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->getFactory()Lorg/apache/http/conn/scheme/SocketFactory;

    move-result-object v0

    .line 169
    :goto_e
    return-object v0

    .line 165
    :cond_f
    iget-boolean v0, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    if-eqz v0, :cond_1e

    .line 166
    new-instance v1, Lorg/apache/http/conn/scheme/LayeredSocketFactoryAdaptor;

    iget-object v0, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    check-cast v0, Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    invoke-direct {v1, v0}, Lorg/apache/http/conn/scheme/LayeredSocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;)V

    move-object v0, v1

    goto :goto_e

    .line 169
    :cond_1e
    new-instance v0, Lorg/apache/http/conn/scheme/SocketFactoryAdaptor;

    iget-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->socketFactory:Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    invoke-direct {v0, v1}, Lorg/apache/http/conn/scheme/SocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/SchemeSocketFactory;)V

    goto :goto_e
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 253
    const/16 v0, 0x11

    .line 254
    .local v0, "hash":I
    iget v1, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(II)I

    move-result v0

    .line 255
    iget-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 256
    iget-boolean v1, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(IZ)I

    move-result v0

    .line 257
    return v0
.end method

.method public final isLayered()Z
    .registers 2

    .prologue
    .line 203
    iget-boolean v0, p0, Lorg/apache/http/conn/scheme/Scheme;->layered:Z

    return v0
.end method

.method public final resolvePort(I)I
    .registers 2
    .param p1, "port"    # I

    .prologue
    .line 216
    if-gtz p1, :cond_4

    iget p1, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    .end local p1    # "port":I
    :cond_4
    return p1
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 226
    iget-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->stringRep:Ljava/lang/String;

    if-nez v1, :cond_22

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 230
    iget v1, p0, Lorg/apache/http/conn/scheme/Scheme;->defaultPort:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->stringRep:Ljava/lang/String;

    .line 233
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    :cond_22
    iget-object v1, p0, Lorg/apache/http/conn/scheme/Scheme;->stringRep:Ljava/lang/String;

    return-object v1
.end method
