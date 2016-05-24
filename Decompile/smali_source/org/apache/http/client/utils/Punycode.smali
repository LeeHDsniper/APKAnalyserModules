.class public Lorg/apache/http/client/utils/Punycode;
.super Ljava/lang/Object;
.source "Punycode.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final impl:Lorg/apache/http/client/utils/Idn;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 43
    :try_start_0
    new-instance v0, Lorg/apache/http/client/utils/JdkIdn;

    invoke-direct {v0}, Lorg/apache/http/client/utils/JdkIdn;-><init>()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_8

    .line 47
    .local v0, "_impl":Lorg/apache/http/client/utils/Idn;
    :goto_5
    sput-object v0, Lorg/apache/http/client/utils/Punycode;->impl:Lorg/apache/http/client/utils/Idn;

    .line 48
    return-void

    .line 44
    .end local v0    # "_impl":Lorg/apache/http/client/utils/Idn;
    :catch_8
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/Exception;
    new-instance v0, Lorg/apache/http/client/utils/Rfc3492Idn;

    invoke-direct {v0}, Lorg/apache/http/client/utils/Rfc3492Idn;-><init>()V

    .restart local v0    # "_impl":Lorg/apache/http/client/utils/Idn;
    goto :goto_5
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toUnicode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "punycode"    # Ljava/lang/String;

    .prologue
    .line 51
    sget-object v0, Lorg/apache/http/client/utils/Punycode;->impl:Lorg/apache/http/client/utils/Idn;

    invoke-interface {v0, p0}, Lorg/apache/http/client/utils/Idn;->toUnicode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
