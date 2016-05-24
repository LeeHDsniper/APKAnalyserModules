.class public Lorg/apache/http/impl/client/LaxRedirectStrategy;
.super Lorg/apache/http/impl/client/DefaultRedirectStrategy;
.source "LaxRedirectStrategy.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final REDIRECT_METHODS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 49
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "GET"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "POST"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "HEAD"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/http/impl/client/LaxRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;-><init>()V

    return-void
.end method


# virtual methods
.method protected isRedirectable(Ljava/lang/String;)Z
    .registers 7
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 57
    sget-object v0, Lorg/apache/http/impl/client/LaxRedirectStrategy;->REDIRECT_METHODS:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_13

    aget-object v3, v0, v1

    .line 58
    .local v3, "m":Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 59
    const/4 v4, 0x1

    .line 62
    .end local v3    # "m":Ljava/lang/String;
    :goto_f
    return v4

    .line 57
    .restart local v3    # "m":Ljava/lang/String;
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 62
    .end local v3    # "m":Ljava/lang/String;
    :cond_13
    const/4 v4, 0x0

    goto :goto_f
.end method
