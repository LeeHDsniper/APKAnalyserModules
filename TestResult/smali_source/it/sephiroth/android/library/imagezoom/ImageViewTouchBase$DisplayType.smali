.class public final enum Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;
.super Ljava/lang/Enum;
.source "ImageViewTouchBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DisplayType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

.field public static final enum FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

.field public static final enum FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

.field public static final enum NONE:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->NONE:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .line 70
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    const-string v1, "FIT_TO_SCREEN"

    invoke-direct {v0, v1, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .line 72
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    const-string v1, "FIT_IF_BIGGER"

    invoke-direct {v0, v1, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->NONE:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    aput-object v1, v0, v2

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    aput-object v1, v0, v4

    sput-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->$VALUES:[Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

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
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    const-class v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->$VALUES:[Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    return-object v0
.end method
