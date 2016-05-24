.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;
.super Ljava/lang/Enum;
.source "AdobeImageAutoCropSortType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

.field public static final enum AdobeImageSortOnAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

.field public static final enum AdobeImageSortOnComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

.field public static final enum AdobeImageSortOnCutThrough:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

.field public static final enum AdobeImageSortOnSaliency:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    const-string v1, "AdobeImageSortOnComposition"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    const-string v1, "AdobeImageSortOnSaliency"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnSaliency:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    const-string v1, "AdobeImageSortOnCutThrough"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnCutThrough:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    const-string v1, "AdobeImageSortOnAll"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    .line 6
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnSaliency:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnCutThrough:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    return-object v0
.end method
