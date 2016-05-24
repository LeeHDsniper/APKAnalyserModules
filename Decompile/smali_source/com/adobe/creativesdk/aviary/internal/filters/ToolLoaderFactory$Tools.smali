.class public final enum Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
.super Ljava/lang/Enum;
.source "ToolLoaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tools"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field public static final enum WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "SHARPNESS"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "EFFECTS"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "REDEYE"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "CROP"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 34
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "WHITEN"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 35
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "DRAW"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "STICKERS"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 37
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "TEXT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 38
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "BLEMISH"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 39
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "MEME"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 40
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "ORIENTATION"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 41
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "ENHANCE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 42
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "FRAMES"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 43
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "SPLASH"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 44
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "FOCUS"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 45
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "BLUR"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 46
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "VIGNETTE"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 47
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "LIGHTING"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 48
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "COLOR"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 49
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    const-string v1, "OVERLAYS"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 29
    const/16 v0, 0x14

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    return-object v0
.end method
