.class Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;
.super Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type1Message"
.end annotation


# instance fields
.field protected domainBytes:[B

.field protected hostBytes:[B


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 980
    invoke-direct {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;-><init>()V

    .line 983
    :try_start_4
    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertHost(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 985
    .local v2, "unqualifiedHost":Ljava/lang/String;
    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertDomain(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 987
    .local v1, "unqualifiedDomain":Ljava/lang/String;
    if-eqz v2, :cond_27

    const-string v4, "ASCII"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    :goto_14
    iput-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->hostBytes:[B

    .line 988
    if-eqz v1, :cond_24

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "ASCII"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    :cond_24
    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->domainBytes:[B
    :try_end_26
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_26} :catch_29

    .line 993
    return-void

    :cond_27
    move-object v4, v3

    .line 987
    goto :goto_14

    .line 990
    .end local v1    # "unqualifiedDomain":Ljava/lang/String;
    .end local v2    # "unqualifiedHost":Ljava/lang/String;
    :catch_29
    move-exception v0

    .line 991
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unicode unsupported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method getResponse()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x28

    const/4 v2, 0x0

    .line 1003
    const/16 v0, 0x28

    .line 1007
    .local v0, "finalLength":I
    const/4 v1, 0x1

    invoke-virtual {p0, v3, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->prepareResponse(II)V

    .line 1010
    const v1, -0x5df77dff

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addULong(I)V

    .line 1035
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1036
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1039
    invoke-virtual {p0, v3}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addULong(I)V

    .line 1042
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1043
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1046
    invoke-virtual {p0, v3}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addULong(I)V

    .line 1049
    const/16 v1, 0x105

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1051
    const/16 v1, 0xa28

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addULong(I)V

    .line 1053
    const/16 v1, 0xf00

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->addUShort(I)V

    .line 1063
    invoke-super {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->getResponse()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
