.class public final enum Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;
.super Ljava/lang/Enum;
.source "DrawableHighlightView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AlignModeV"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

.field public static final enum Bottom:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

.field public static final enum Center:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

.field public static final enum Top:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 956
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    const-string v1, "Top"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Top:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    const-string v1, "Bottom"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Bottom:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    const-string v1, "Center"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Center:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    .line 955
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Top:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Bottom:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Center:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

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
    .line 955
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 955
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;
    .registers 1

    .prologue
    .line 955
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    return-object v0
.end method
