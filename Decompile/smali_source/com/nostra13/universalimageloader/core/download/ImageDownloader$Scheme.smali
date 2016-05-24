.class public final enum Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
.super Ljava/lang/Enum;
.source "ImageDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/download/ImageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scheme"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum CONTENT:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum HTTP:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum HTTPS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

.field public static final enum UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;


# instance fields
.field private scheme:Ljava/lang/String;

.field private uriPrefix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 46
    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "HTTP"

    const-string v2, "http"

    invoke-direct {v0, v1, v4, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->HTTP:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "HTTPS"

    const-string v2, "https"

    invoke-direct {v0, v1, v5, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->HTTPS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "FILE"

    const-string v2, "file"

    invoke-direct {v0, v1, v6, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "CONTENT"

    const-string v2, "content"

    invoke-direct {v0, v1, v7, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->CONTENT:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "ASSETS"

    const-string v2, "assets"

    invoke-direct {v0, v1, v8, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "DRAWABLE"

    const/4 v2, 0x5

    const-string v3, "drawable"

    invoke-direct {v0, v1, v2, v3}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    new-instance v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x6

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    .line 45
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->HTTP:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->HTTPS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v1, v0, v6

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->CONTENT:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v1, v0, v7

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    aput-object v2, v0, v1

    sput-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->$VALUES:[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 6
    .param p3, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 52
    iput-object p3, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->scheme:Ljava/lang/String;

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->uriPrefix:Ljava/lang/String;

    .line 54
    return-void
.end method

.method private belongsTo(Ljava/lang/String;)Z
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 74
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->uriPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .registers 6
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    .line 63
    if-eqz p0, :cond_16

    .line 64
    invoke-static {}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->values()[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v0

    .local v0, "arr$":[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_16

    aget-object v3, v0, v1

    .line 65
    .local v3, "s":Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    invoke-direct {v3, p0}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->belongsTo(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 70
    .end local v0    # "arr$":[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "s":Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    :goto_12
    return-object v3

    .line 64
    .restart local v0    # "arr$":[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "s":Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 70
    .end local v0    # "arr$":[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "s":Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    :cond_16
    sget-object v3, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->UNKNOWN:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    goto :goto_12
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    const-class v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    return-object v0
.end method

.method public static values()[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;
    .registers 1

    .prologue
    .line 45
    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->$VALUES:[Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v0}, [Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    return-object v0
.end method


# virtual methods
.method public crop(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->belongsTo(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "URI [%1$s] doesn\'t have expected scheme [%2$s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->scheme:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_1d
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->uriPrefix:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public wrap(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->uriPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
