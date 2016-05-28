.class public final enum Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;
.super Ljava/lang/Enum;
.source "EasingType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

.field public static final enum IN:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

.field public static final enum INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

.field public static final enum OUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    const-string v1, "IN"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->IN:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    const-string v1, "OUT"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->OUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    const-string v1, "INOUT"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    .line 7
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->IN:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->OUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

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
    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 7
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;
    .registers 1

    .prologue
    .line 7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    return-object v0
.end method
