.class public final Lorg/apache/http/HttpVersion;
.super Lorg/apache/http/ProtocolVersion;
.source "HttpVersion.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final HTTP:Ljava/lang/String; = "HTTP"

.field public static final HTTP_0_9:Lorg/apache/http/HttpVersion;

.field public static final HTTP_1_0:Lorg/apache/http/HttpVersion;

.field public static final HTTP_1_1:Lorg/apache/http/HttpVersion;

.field private static final serialVersionUID:J = -0x514703574c384bf0L


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 57
    new-instance v0, Lorg/apache/http/HttpVersion;

    const/16 v1, 0x9

    invoke-direct {v0, v3, v1}, Lorg/apache/http/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/http/HttpVersion;->HTTP_0_9:Lorg/apache/http/HttpVersion;

    .line 60
    new-instance v0, Lorg/apache/http/HttpVersion;

    invoke-direct {v0, v2, v3}, Lorg/apache/http/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    .line 63
    new-instance v0, Lorg/apache/http/HttpVersion;

    invoke-direct {v0, v2, v2}, Lorg/apache/http/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    .line 75
    const-string v0, "HTTP"

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    .line 76
    return-void
.end method


# virtual methods
.method public forVersion(II)Lorg/apache/http/ProtocolVersion;
    .registers 5
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    const/4 v1, 0x1

    .line 90
    iget v0, p0, Lorg/apache/http/HttpVersion;->major:I

    if-ne p1, v0, :cond_a

    iget v0, p0, Lorg/apache/http/HttpVersion;->minor:I

    if-ne p2, v0, :cond_a

    .line 107
    .end local p0    # "this":Lorg/apache/http/HttpVersion;
    :goto_9
    return-object p0

    .line 94
    .restart local p0    # "this":Lorg/apache/http/HttpVersion;
    :cond_a
    if-ne p1, v1, :cond_16

    .line 95
    if-nez p2, :cond_11

    .line 96
    sget-object p0, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    goto :goto_9

    .line 98
    :cond_11
    if-ne p2, v1, :cond_16

    .line 99
    sget-object p0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    goto :goto_9

    .line 102
    :cond_16
    if-nez p1, :cond_1f

    const/16 v0, 0x9

    if-ne p2, v0, :cond_1f

    .line 103
    sget-object p0, Lorg/apache/http/HttpVersion;->HTTP_0_9:Lorg/apache/http/HttpVersion;

    goto :goto_9

    .line 107
    :cond_1f
    new-instance p0, Lorg/apache/http/HttpVersion;

    .end local p0    # "this":Lorg/apache/http/HttpVersion;
    invoke-direct {p0, p1, p2}, Lorg/apache/http/HttpVersion;-><init>(II)V

    goto :goto_9
.end method
