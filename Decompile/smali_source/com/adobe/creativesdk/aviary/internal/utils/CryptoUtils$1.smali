.class final Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils$1;
.super Ljava/lang/Object;
.source "CryptoUtils.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/apache/http/NameValuePair;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 20
    check-cast p1, Lorg/apache/http/NameValuePair;

    check-cast p2, Lorg/apache/http/NameValuePair;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils$1;->compare(Lorg/apache/http/NameValuePair;Lorg/apache/http/NameValuePair;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/apache/http/NameValuePair;Lorg/apache/http/NameValuePair;)I
    .registers 5
    .param p1, "element1"    # Lorg/apache/http/NameValuePair;
    .param p2, "element2"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 23
    invoke-interface {p1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
