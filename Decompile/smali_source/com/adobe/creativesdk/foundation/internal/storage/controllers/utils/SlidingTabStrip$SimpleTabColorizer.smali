.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;
.super Ljava/lang/Object;
.source "SlidingTabStrip.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleTabColorizer"
.end annotation


# instance fields
.field private mIndicatorColors:[I


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$1;

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;-><init>()V

    return-void
.end method


# virtual methods
.method public final getIndicatorColor(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;->mIndicatorColors:[I

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;->mIndicatorColors:[I

    array-length v1, v1

    rem-int v1, p1, v1

    aget v0, v0, v1

    return v0
.end method

.method varargs setIndicatorColors([I)V
    .registers 2
    .param p1, "colors"    # [I

    .prologue
    .line 172
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;->mIndicatorColors:[I

    .line 173
    return-void
.end method
