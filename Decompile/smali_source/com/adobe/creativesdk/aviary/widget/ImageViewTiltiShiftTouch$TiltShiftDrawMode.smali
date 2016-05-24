.class public final enum Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
.super Ljava/lang/Enum;
.source "ImageViewTiltiShiftTouch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TiltShiftDrawMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

.field public static final enum Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

.field public static final enum None:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

.field public static final enum Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 799
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    const-string v1, "Radial"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    const-string v1, "Linear"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    const-string v1, "None"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->None:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    .line 798
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->None:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

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
    .line 798
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 798
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    .registers 1

    .prologue
    .line 798
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    return-object v0
.end method
