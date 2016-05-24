.class public final enum Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;
.super Ljava/lang/Enum;
.source "ImageViewTouchAndDraw.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TouchMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

.field public static final enum DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

.field public static final enum IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 266
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    const-string v1, "IMAGE"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    const-string v1, "DRAW"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    .line 265
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

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
    .line 265
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 265
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;
    .registers 1

    .prologue
    .line 265
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    return-object v0
.end method
