.class public final enum Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
.super Ljava/lang/Enum;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PackType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field public static final enum EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field public static final enum FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field public static final enum OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field public static final enum STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 18
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    const-string v1, "FRAME"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    const-string v1, "EFFECT"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    const-string v1, "STICKER"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    const-string v1, "OVERLAY"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 17
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

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
    .line 17
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 2
    .param p0, "packType"    # Ljava/lang/String;

    .prologue
    .line 21
    const-string v0, "effect"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 25
    :goto_a
    return-object v0

    .line 22
    :cond_b
    const-string v0, "frame"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    goto :goto_a

    .line 23
    :cond_16
    const-string v0, "sticker"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    goto :goto_a

    .line 24
    :cond_21
    const-string v0, "overlay"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    goto :goto_a

    .line 25
    :cond_2c
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 17
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    return-object v0
.end method


# virtual methods
.method public toCdsString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
