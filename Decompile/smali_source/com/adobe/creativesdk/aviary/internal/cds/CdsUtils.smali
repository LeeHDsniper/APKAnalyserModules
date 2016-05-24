.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;
.super Ljava/lang/Object;
.source "CdsUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    }
.end annotation


# static fields
.field public static final CDS_SUPPORTED_COUNTRIES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final CDS_SUPPORTED_LANGUAGES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final DOWNLOAD_REF_ID_PROJECTION:[Ljava/lang/String;

.field static final SUPPORTED_DENSITIES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final S_LEGACY_PACKS_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static sResolution:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 200
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "download_refId"

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->DOWNLOAD_REF_ID_PROJECTION:[Ljava/lang/String;

    .line 204
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    .line 208
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.01"

    const-string v2, "com.aviary.android.feather.plugins.filters.grunge"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.02"

    const-string v2, "com.aviary.android.feather.plugins.filters.nostalgia"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.03"

    const-string v2, "com.aviary.android.feather.plugins.filters.camera"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.05"

    const-string v2, "com.aviary.android.feather.plugins.filters.tidal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.06"

    const-string v2, "com.aviary.android.feather.plugins.filters.original"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.07"

    const-string v2, "com.aviary.android.feather.plugins.filters.toycamera"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.08"

    const-string v2, "com.aviary.android.feather.plugins.filters.love"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.32"

    const-string v2, "com.aviary.android.feather.plugins.filters.street"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.45"

    const-string v2, "com.aviary.android.feather.plugins.filters.woodland"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.68"

    const-string v2, "com.aviary.android.feather.plugins.filters.noir"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.77"

    const-string v2, "com.aviary.android.feather.plugins.filters.fireworks"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.80"

    const-string v2, "com.aviary.android.feather.plugins.filters.shadowpro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.83"

    const-string v2, "com.aviary.android.feather.plugins.filters.astro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.88"

    const-string v2, "com.aviary.android.feather.plugins.filters.wanderlust"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.95"

    const-string v2, "com.aviary.android.feather.plugins.filters.archetype"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.98"

    const-string v2, "com.aviary.android.feather.plugins.filters.sagapro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.99"

    const-string v2, "com.aviary.android.feather.plugins.filters.gotham"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.104"

    const-string v2, "com.aviary.android.feather.plugins.filters.runway"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.109"

    const-string v2, "com.aviary.android.feather.plugins.filters.signetpro"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.116"

    const-string v2, "com.aviary.android.feather.plugins.filters.cam80s"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.effectpack.117"

    const-string v2, "com.aviary.android.feather.plugins.filters.foodie"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.00"

    const-string v2, "com.aviary.android.feather.plugins.stickers.free_stickers"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.01"

    const-string v2, "com.aviary.android.feather.plugins.stickers.moustaches"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.02"

    const-string v2, "com.aviary.android.feather.plugins.stickers.animal"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.03"

    const-string v2, "com.aviary.android.feather.plugins.stickers.halloween"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.04"

    const-string v2, "com.aviary.android.feather.plugins.stickers.american_football"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.05"

    const-string v2, "com.aviary.android.feather.plugins.stickers.hats"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.07"

    const-string v2, "com.aviary.android.feather.plugins.stickers.helmets"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.08"

    const-string v2, "com.aviary.android.feather.plugins.stickers.holiday"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.09"

    const-string v2, "com.aviary.android.feather.plugins.stickers.space"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.10"

    const-string v2, "com.aviary.android.feather.plugins.stickers.galaxy"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.11"

    const-string v2, "com.aviary.android.feather.plugins.stickers.love"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.13"

    const-string v2, "com.aviary.android.feather.plugins.stickers.glasses"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.35"

    const-string v2, "com.aviary.android.feather.plugins.stickers.doodles"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.37"

    const-string v2, "com.aviary.android.feather.plugins.stickers.petdressup"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.stickerpack.41"

    const-string v2, "com.aviary.android.feather.plugins.stickers.travel"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.framepack.00"

    const-string v2, "com.aviary.android.feather.plugins.borders.free"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.framepack.04"

    const-string v2, "com.aviary.android.feather.plugins.borders.drift"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.framepack.05"

    const-string v2, "com.aviary.android.feather.plugins.borders.bloom"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.framepack.06"

    const-string v2, "com.aviary.android.feather.plugins.borders.artdeco"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->S_LEGACY_PACKS_MAP:Ljava/util/HashMap;

    const-string v1, "com.aviary.framepack.07"

    const-string v2, "com.aviary.android.feather.plugins.borders.rugged"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "en"

    aput-object v2, v1, v4

    const-string v2, "ja"

    aput-object v2, v1, v5

    const-string v2, "zh"

    aput-object v2, v1, v6

    const-string v2, "ko"

    aput-object v2, v1, v7

    const-string v2, "id"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const-string v3, "pt"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "fr"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "de"

    aput-object v3, v1, v2

    .line 256
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->CDS_SUPPORTED_LANGUAGES:Ljava/util/List;

    .line 257
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "US"

    aput-object v2, v1, v4

    const-string v2, "JP"

    aput-object v2, v1, v5

    const-string v2, "CN"

    aput-object v2, v1, v6

    const-string v2, "KR"

    aput-object v2, v1, v7

    const-string v2, "ID"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const-string v3, "IN"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "BR"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "GB"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "FR"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "DE"

    aput-object v3, v1, v2

    .line 258
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->CDS_SUPPORTED_COUNTRIES:Ljava/util/List;

    .line 907
    new-array v0, v8, [Ljava/lang/Integer;

    const/16 v1, 0xa0

    .line 908
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    const/16 v1, 0xf0

    .line 909
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    const/16 v1, 0x140

    .line 910
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    const/16 v1, 0x1e0

    .line 911
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v7

    .line 907
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    return-void
.end method

.method public static extractSkuByPackType(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "packType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1347
    .local p0, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1348
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1349
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.aviary."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1350
    .local v0, "compare":Ljava/lang/String;
    :cond_1c
    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    .line 1351
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1352
    .local v1, "current":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 1353
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1354
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1c

    .line 1357
    .end local v1    # "current":Ljava/lang/String;
    :cond_35
    return-object v3
.end method

.method static getContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "requestCode"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 301
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method static getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 358
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "manifestVersion"

    .line 359
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    .line 358
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 364
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_22

    :try_start_14
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 365
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_26

    move-result-object v2

    .line 368
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 370
    :goto_21
    return-object v2

    .line 368
    :cond_22
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_21

    :catchall_26
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public static getMessageByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 375
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "message/identifier/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 376
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    .line 375
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 378
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 381
    .local v7, "result":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    if-eqz v6, :cond_30

    :try_start_26
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 382
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    :try_end_2f
    .catchall {:try_start_26 .. :try_end_2f} :catchall_34

    move-result-object v7

    .line 385
    :cond_30
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 388
    return-object v7

    .line 385
    :catchall_34
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public static getPackByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 417
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/identifier/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 418
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    .line 417
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 420
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 423
    .local v6, "currentPack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v7, :cond_30

    :try_start_26
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 424
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :try_end_2f
    .catchall {:try_start_26 .. :try_end_2f} :catchall_34

    move-result-object v6

    .line 427
    :cond_30
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 430
    return-object v6

    .line 427
    :catchall_34
    move-exception v0

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public static getPackContentById(Landroid/content/Context;J[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 434
    const/4 v8, 0x0

    .line 435
    .local v8, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const/4 v6, 0x0

    .line 436
    .local v6, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/content"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 437
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v2, p3

    move-object v4, v3

    move-object v5, v3

    .line 436
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 440
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_42

    :try_start_2d
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 441
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v8

    .line 442
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    .line 443
    if-eqz v8, :cond_42

    if-eqz v6, :cond_42

    .line 444
    invoke-virtual {v8, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->setContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)V
    :try_end_42
    .catchall {:try_start_2d .. :try_end_42} :catchall_46

    .line 448
    :cond_42
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 450
    return-object v8

    .line 448
    :catchall_46
    move-exception v0

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public static getPackContentPath(Landroid/content/Context;J)Ljava/lang/String;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J

    .prologue
    const/4 v3, 0x0

    .line 461
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/content"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 462
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "content_contentPath"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    .line 461
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 469
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_45

    .line 471
    :try_start_32
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_46

    .line 472
    const-string v0, "content_contentPath"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_41
    .catchall {:try_start_32 .. :try_end_41} :catchall_4a

    move-result-object v3

    .line 475
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 478
    :cond_45
    :goto_45
    return-object v3

    .line 475
    :cond_46
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_45

    :catchall_4a
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public static getPackDownloadStatus(Landroid/content/Context;J)Landroid/util/Pair;
    .registers 20
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 489
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "packDownloadStatus/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p1

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 490
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->DOWNLOAD_REF_ID_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 489
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 492
    .local v8, "cursor":Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 493
    .local v9, "downloadCursor":Landroid/database/Cursor;
    const-string v2, "download"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/DownloadManager;

    .line 495
    .local v12, "downloadManager":Landroid/app/DownloadManager;
    if-eqz v8, :cond_8a

    :try_start_35
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_8a

    .line 496
    const/4 v2, 0x0

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 497
    .local v10, "downloadId":J
    new-instance v13, Landroid/app/DownloadManager$Query;

    invoke-direct {v13}, Landroid/app/DownloadManager$Query;-><init>()V

    .line 498
    .local v13, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, 0x1

    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide v10, v2, v3

    invoke-virtual {v13, v2}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    .line 499
    invoke-virtual {v12, v13}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v9

    .line 500
    if-eqz v9, :cond_5a

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_57
    .catchall {:try_start_35 .. :try_end_57} :catchall_92

    move-result v2

    if-nez v2, :cond_62

    .line 501
    :cond_5a
    const/4 v2, 0x0

    .line 508
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 509
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 511
    .end local v10    # "downloadId":J
    .end local v13    # "query":Landroid/app/DownloadManager$Query;
    :goto_61
    return-object v2

    .line 503
    .restart local v10    # "downloadId":J
    .restart local v13    # "query":Landroid/app/DownloadManager$Query;
    :cond_62
    :try_start_62
    const-string v2, "status"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 504
    .local v15, "status":I
    const-string v2, "reason"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 505
    .local v14, "reasonCode":I
    new-instance v2, Landroid/util/Pair;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v15, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getReasonText(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_83
    .catchall {:try_start_62 .. :try_end_83} :catchall_92

    .line 508
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 509
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_61

    .line 508
    .end local v10    # "downloadId":J
    .end local v13    # "query":Landroid/app/DownloadManager$Query;
    .end local v14    # "reasonCode":I
    .end local v15    # "status":I
    :cond_8a
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 509
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 511
    const/4 v2, 0x0

    goto :goto_61

    .line 508
    :catchall_92
    move-exception v2

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 509
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public static getPackFullInfoById(Landroid/content/Context;J)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J

    .prologue
    const/4 v2, 0x0

    .line 515
    const/4 v8, 0x0

    .line 516
    .local v8, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pack/id/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/content"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 517
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 519
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_3d

    :try_start_2c
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 520
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v8

    .line 521
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    .line 522
    .local v6, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual {v8, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->setContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)V
    :try_end_3d
    .catchall {:try_start_2c .. :try_end_3d} :catchall_41

    .line 526
    .end local v6    # "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    :cond_3d
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 528
    return-object v8

    .line 526
    :catchall_41
    move-exception v0

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method static getPackIconPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "packIdentifier"    # Ljava/lang/String;

    .prologue
    .line 579
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackRootContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/icon"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getPackItemsContentPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "packIdentifier"    # Ljava/lang/String;

    .prologue
    .line 589
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackRootContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/pack_content"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackOptionDownloadStatus(Landroid/content/Context;J)Landroid/util/Pair;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 722
    if-nez p0, :cond_5

    move-object v1, v2

    .line 748
    :goto_4
    return-object v1

    .line 726
    :cond_5
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackDownloadStatus(Landroid/content/Context;J)Landroid/util/Pair;

    move-result-object v0

    .line 728
    .local v0, "status":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/String;>;"
    if-eqz v0, :cond_36

    .line 733
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    move-object v1, v2

    .line 745
    goto :goto_4

    .line 736
    :sswitch_18
    new-instance v1, Landroid/util/Pair;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    .line 740
    :sswitch_22
    new-instance v1, Landroid/util/Pair;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOADING:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    .line 743
    :sswitch_2c
    new-instance v1, Landroid/util/Pair;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_COMPLETE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    :cond_36
    move-object v1, v2

    .line 748
    goto :goto_4

    .line 733
    :sswitch_data_38
    .sparse-switch
        0x1 -> :sswitch_22
        0x2 -> :sswitch_22
        0x4 -> :sswitch_18
        0x8 -> :sswitch_2c
        0x10 -> :sswitch_18
    .end sparse-switch
.end method

.method static getPackRootContent(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "identifier"    # Ljava/lang/String;

    .prologue
    .line 759
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cdsv2/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getPacksList(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 782
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pack/list"

    .line 783
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v5, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 782
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static getPermissions(Landroid/content/Context;)Ljava/util/List;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 996
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "permissions/list"

    .line 997
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "perm_value"

    aput-object v4, v2, v5

    move-object v4, v3

    move-object v5, v3

    .line 996
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 999
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_54

    .line 1001
    :try_start_1b
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1002
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1003
    .local v8, "permissions":Ljava/lang/String;
    const-string v0, "CdsUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permissions: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1004
    const-string v0, ","

    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_48} :catch_4d
    .catchall {:try_start_1b .. :try_end_48} :catchall_5e

    move-result-object v0

    .line 1008
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 1011
    .end local v8    # "permissions":Ljava/lang/String;
    :goto_4c
    return-object v0

    .line 1005
    :catch_4d
    move-exception v7

    .line 1006
    .local v7, "e":Ljava/lang/Exception;
    :try_start_4e
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_5e

    .line 1008
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 1011
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_4c

    .line 1008
    :catchall_5e
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method static getReasonText(II)Ljava/lang/String;
    .registers 3
    .param p0, "status"    # I
    .param p1, "reason"    # I

    .prologue
    .line 852
    sparse-switch p0, :sswitch_data_10

    .line 860
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 854
    :sswitch_5
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getReasonTextPaused(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 857
    :sswitch_a
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getReasonTextFailed(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 852
    nop

    :sswitch_data_10
    .sparse-switch
        0x4 -> :sswitch_5
        0x10 -> :sswitch_a
    .end sparse-switch
.end method

.method static getReasonTextFailed(I)Ljava/lang/String;
    .registers 2
    .param p0, "reason"    # I

    .prologue
    .line 865
    packed-switch p0, :pswitch_data_16

    .line 885
    :pswitch_3
    const-string v0, "Unknown error"

    :goto_5
    return-object v0

    .line 867
    :pswitch_6
    const-string v0, "Cannot resume download"

    goto :goto_5

    .line 870
    :pswitch_9
    const-string v0, "SD card not mounted"

    goto :goto_5

    .line 873
    :pswitch_c
    const-string v0, "File already exists"

    goto :goto_5

    .line 876
    :pswitch_f
    const-string v0, "Failed to download file"

    goto :goto_5

    .line 879
    :pswitch_12
    const-string v0, "SD card is full"

    goto :goto_5

    .line 865
    nop

    :pswitch_data_16
    .packed-switch 0x3ec
        :pswitch_f
        :pswitch_3
        :pswitch_12
        :pswitch_9
        :pswitch_6
        :pswitch_c
    .end packed-switch
.end method

.method static getReasonTextPaused(I)Ljava/lang/String;
    .registers 2
    .param p0, "reason"    # I

    .prologue
    .line 890
    packed-switch p0, :pswitch_data_10

    .line 902
    const-string v0, "Paused"

    :goto_5
    return-object v0

    .line 892
    :pswitch_6
    const-string v0, "Paused, waiting for wifi"

    goto :goto_5

    .line 895
    :pswitch_9
    const-string v0, "Paused. Waiting for network"

    goto :goto_5

    .line 898
    :pswitch_c
    const-string v0, "Paused. Waiting to retry"

    goto :goto_5

    .line 890
    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method

.method public static getResolution(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    .line 916
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    if-nez v3, :cond_21

    .line 918
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 920
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v0, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 922
    .local v0, "density":I
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 923
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolutionString(I)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    .line 961
    .end local v0    # "density":I
    .end local v1    # "metrics":Landroid/util/DisplayMetrics;
    :cond_21
    :goto_21
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    return-object v3

    .line 928
    .restart local v0    # "density":I
    .restart local v1    # "metrics":Landroid/util/DisplayMetrics;
    :cond_24
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v0, v3, :cond_4c

    .line 929
    const-string v3, "CdsUtils"

    const-string v4, "resolution is too small"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 930
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolutionString(I)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    goto :goto_21

    .line 935
    :cond_4c
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-le v0, v3, :cond_84

    .line 936
    const-string v3, "CdsUtils"

    const-string v4, "resolution is too big"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 937
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolutionString(I)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    goto :goto_21

    .line 941
    :cond_84
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ba

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 942
    .local v2, "supported":I
    if-le v2, v0, :cond_8a

    .line 943
    const-string v3, "CdsUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "use resolution: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 944
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolutionString(I)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    .line 949
    .end local v2    # "supported":I
    :cond_ba
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    if-nez v3, :cond_21

    .line 951
    const-string v3, "CdsUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "use a custom fallback resolution:  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    .line 953
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 951
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 955
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->SUPPORTED_DENSITIES:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolutionString(I)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->sResolution:Ljava/lang/String;

    goto/16 :goto_21
.end method

.method public static getResolutionString(I)Ljava/lang/String;
    .registers 2
    .param p0, "density"    # I

    .prologue
    .line 971
    sparse-switch p0, :sswitch_data_18

    .line 985
    const-string v0, "high"

    :goto_5
    return-object v0

    .line 973
    :sswitch_6
    const-string v0, "xxxhigh"

    goto :goto_5

    .line 975
    :sswitch_9
    const-string v0, "xxhigh"

    goto :goto_5

    .line 977
    :sswitch_c
    const-string v0, "xhigh"

    goto :goto_5

    .line 979
    :sswitch_f
    const-string v0, "high"

    goto :goto_5

    .line 981
    :sswitch_12
    const-string v0, "medium"

    goto :goto_5

    .line 983
    :sswitch_15
    const-string v0, "low"

    goto :goto_5

    .line 971
    :sswitch_data_18
    .sparse-switch
        0x78 -> :sswitch_15
        0xa0 -> :sswitch_12
        0xf0 -> :sswitch_f
        0x140 -> :sswitch_c
        0x1e0 -> :sswitch_9
        0x280 -> :sswitch_6
    .end sparse-switch
.end method

.method static notifyCdsServiceFinished(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .prologue
    .line 1021
    if-eqz p0, :cond_2d

    .line 1022
    const-string v1, "CdsUtils"

    const-string v2, "notifyCdsServiceFinished"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1023
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.serviceFinished"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1024
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "operations"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1025
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1027
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2d
    return-void
.end method

.method static notifyDownloadMissingPacksCompleted(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "error"    # I

    .prologue
    .line 1053
    if-eqz p0, :cond_53

    .line 1054
    const-string v1, "CdsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyDownloadMissingPacksCompleted{packType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1057
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.downloadMissingPacksCompleted"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1058
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "error"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1059
    const-string v1, "packType"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1060
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1062
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_53
    return-void
.end method

.method public static notifyDownloadStatusChange(Landroid/content/Context;JLjava/lang/String;I)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "newStatus"    # I

    .prologue
    .line 1033
    if-eqz p0, :cond_62

    .line 1034
    const-string v1, "CdsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyDownloadStatusChange{packId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", packType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", status:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1037
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.downloadStatusChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1038
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "packId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1039
    const-string v1, "status"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1040
    const-string v1, "packType"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1041
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1043
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_62
    return-void
.end method

.method static notifyMessageContentUpdate(Landroid/content/Context;J)V
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "messageId"    # J

    .prologue
    .line 1070
    if-eqz p0, :cond_2

    .line 1073
    :cond_2
    return-void
.end method

.method static notifyPackContentUpdate(Landroid/content/Context;J)V
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J

    .prologue
    .line 1083
    if-eqz p0, :cond_44

    .line 1084
    const-string v1, "CdsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyPackContentUpdate{packId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1086
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.packUpdated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1087
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "packId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1088
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1090
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_44
    return-void
.end method

.method static notifyPackInstalled(Landroid/content/Context;JLjava/lang/String;I)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "installed"    # I

    .prologue
    .line 1099
    if-eqz p0, :cond_58

    .line 1100
    const-string v1, "CdsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyPackInstalled{packId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", packType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.packInstalled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1103
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "packType"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1104
    const-string v1, "packId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1105
    const-string v1, "purchased"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1107
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1109
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_58
    return-void
.end method

.method public static notifyPackPurchased(Landroid/content/Context;JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 1119
    if-eqz p0, :cond_58

    .line 1120
    const-string v1, "CdsUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyPackPurchased{packId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", packType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1121
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cds.packPurchased"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1122
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "packType"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1123
    const-string v1, "packId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1124
    const-string v1, "purchase"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1125
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1127
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_58
    return-void
.end method

.method static notifyPackTypeContentUpdated(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    .line 1136
    if-eqz p0, :cond_3f

    .line 1137
    const-string v0, "CdsUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyPackTypeContentUpdated{packType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1138
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "packTray/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1139
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1141
    :cond_3f
    return-void
.end method

.method static notifyPermissionsUpdated(Landroid/content/Context;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1149
    if-eqz p0, :cond_17

    .line 1150
    const-string v0, "CdsUtils"

    const-string v1, "notifyPermissionsUpdated"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "permissions/updated"

    .line 1152
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1154
    :cond_17
    return-void
.end method

.method public static requestPackDownload(Landroid/content/Context;JZ)Ljava/lang/String;
    .registers 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packId"    # J
    .param p3, "notify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1221
    const-string v0, "Invalid Context"

    invoke-static {v0, p0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1223
    const-string v0, "CdsUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestPackDownload{packId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1225
    const/4 v9, 0x0

    .line 1226
    .local v9, "packIdentifier":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1228
    .local v6, "contentUrl":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/content"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1229
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "pack_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "pack_identifier"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "content_id"

    aput-object v5, v2, v4

    const/4 v4, 0x3

    const-string v5, "content_contentURL"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    .line 1228
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1236
    .local v8, "packCursor":Landroid/database/Cursor;
    const-string v0, "Invalid Cursor"

    invoke-static {v0, v8}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1239
    :try_start_69
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_83

    .line 1240
    const-string v0, "pack_identifier"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1241
    const-string v0, "content_contentURL"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_82
    .catchall {:try_start_69 .. :try_end_82} :catchall_9b

    move-result-object v6

    .line 1244
    :cond_83
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 1247
    const-string v0, "Failed to retrieve the pack identifier"

    invoke-static {v0, v9}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1248
    const-string v0, "Failed to retrieve the pack download url"

    invoke-static {v0, v6}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1250
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v7

    .line 1251
    .local v7, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    invoke-virtual {v7, p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;JZ)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1244
    .end local v7    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :catchall_9b
    move-exception v0

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method
