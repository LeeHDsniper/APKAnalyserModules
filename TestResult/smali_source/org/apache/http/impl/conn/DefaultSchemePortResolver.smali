.class public Lorg/apache/http/impl/conn/DefaultSchemePortResolver;
.super Ljava/lang/Object;
.source "DefaultSchemePortResolver.java"

# interfaces
.implements Lorg/apache/http/conn/SchemePortResolver;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/conn/DefaultSchemePortResolver;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    new-instance v0, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lorg/apache/http/impl/conn/DefaultSchemePortResolver;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public resolve(Lorg/apache/http/HttpHost;)I
    .registers 7
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/conn/UnsupportedSchemeException;
        }
    .end annotation

    .prologue
    .line 46
    const-string v2, "HTTP host"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 47
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v1

    .line 48
    .local v1, "port":I
    if-lez v1, :cond_c

    .line 55
    .end local v1    # "port":I
    :goto_b
    return v1

    .line 51
    .restart local v1    # "port":I
    :cond_c
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "name":Ljava/lang/String;
    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 53
    const/16 v1, 0x50

    goto :goto_b

    .line 54
    :cond_1b
    const-string v2, "https"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 55
    const/16 v1, 0x1bb

    goto :goto_b

    .line 57
    :cond_26
    new-instance v2, Lorg/apache/http/conn/UnsupportedSchemeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " protocol is not supported"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
