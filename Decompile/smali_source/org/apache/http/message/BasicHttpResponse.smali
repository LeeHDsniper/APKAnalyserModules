.class public Lorg/apache/http/message/BasicHttpResponse;
.super Lorg/apache/http/message/AbstractHttpMessage;
.source "BasicHttpResponse.java"

# interfaces
.implements Lorg/apache/http/HttpResponse;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private code:I

.field private entity:Lorg/apache/http/HttpEntity;

.field private locale:Ljava/util/Locale;

.field private final reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

.field private reasonPhrase:Ljava/lang/String;

.field private statusline:Lorg/apache/http/StatusLine;

.field private ver:Lorg/apache/http/ProtocolVersion;


# direct methods
.method public constructor <init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V
    .registers 6
    .param p1, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p2, "code"    # I
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 115
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 116
    const-string v0, "Status code"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 117
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 118
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 119
    iput p2, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 120
    iput-object p3, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 121
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    .line 122
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    .line 123
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/StatusLine;)V
    .registers 4
    .param p1, "statusline"    # Lorg/apache/http/StatusLine;

    .prologue
    const/4 v1, 0x0

    .line 93
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 94
    const-string v0, "Status line"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/StatusLine;

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 95
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 96
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 97
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 98
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    .line 99
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    .line 100
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/StatusLine;Lorg/apache/http/ReasonPhraseCatalog;Ljava/util/Locale;)V
    .registers 5
    .param p1, "statusline"    # Lorg/apache/http/StatusLine;
    .param p2, "catalog"    # Lorg/apache/http/ReasonPhraseCatalog;
    .param p3, "locale"    # Ljava/util/Locale;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 77
    const-string v0, "Status line"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/StatusLine;

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 78
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 79
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 80
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 81
    iput-object p2, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    .line 82
    iput-object p3, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    .line 83
    return-void
.end method


# virtual methods
.method public getEntity()Lorg/apache/http/HttpEntity;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->entity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getProtocolVersion()Lorg/apache/http/ProtocolVersion;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    return-object v0
.end method

.method protected getReason(I)Ljava/lang/String;
    .registers 4
    .param p1, "code"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    if-eqz v0, :cond_16

    iget-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    :goto_c
    invoke-interface {v1, p1, v0}, Lorg/apache/http/ReasonPhraseCatalog;->getReason(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    :goto_10
    return-object v0

    :cond_11
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    goto :goto_c

    :cond_16
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getStatusLine()Lorg/apache/http/StatusLine;
    .registers 5

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    if-nez v0, :cond_15

    .line 134
    new-instance v1, Lorg/apache/http/message/BasicStatusLine;

    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    :goto_c
    iget v2, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    iget-object v3, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 139
    :cond_15
    iget-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    return-object v0

    .line 134
    :cond_18
    sget-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    goto :goto_c
.end method

.method public setEntity(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 197
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpResponse;->entity:Lorg/apache/http/HttpEntity;

    .line 198
    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 205
    const-string v0, "Locale"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    .line 206
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 207
    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 3
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 192
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setStatusCode(I)V
    .registers 3
    .param p1, "code"    # I

    .prologue
    .line 184
    const-string v0, "Status code"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 186
    iput p1, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 187
    return-void
.end method

.method public setStatusLine(Lorg/apache/http/ProtocolVersion;I)V
    .registers 5
    .param p1, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p2, "code"    # I

    .prologue
    const/4 v1, 0x0

    .line 165
    const-string v0, "Status code"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 166
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 167
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 168
    iput p2, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 169
    iput-object v1, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setStatusLine(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V
    .registers 5
    .param p1, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p2, "code"    # I
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 175
    const-string v0, "Status code"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 176
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 177
    iput-object p1, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 178
    iput p2, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 179
    iput-object p3, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 180
    return-void
.end method

.method public setStatusLine(Lorg/apache/http/StatusLine;)V
    .registers 3
    .param p1, "statusline"    # Lorg/apache/http/StatusLine;

    .prologue
    .line 157
    const-string v0, "Status line"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/StatusLine;

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->statusline:Lorg/apache/http/StatusLine;

    .line 158
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->ver:Lorg/apache/http/ProtocolVersion;

    .line 159
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicHttpResponse;->code:I

    .line 160
    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 228
    invoke-virtual {p0}, Lorg/apache/http/message/BasicHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    .line 229
    .local v0, "statusline":Lorg/apache/http/StatusLine;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/message/BasicHttpResponse;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
