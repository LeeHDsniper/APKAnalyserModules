.class Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "SlidingUpPanelLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1313
    new-instance v0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState$1;

    invoke-direct {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState$1;-><init>()V

    sput-object v0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 5
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 1299
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 1301
    :try_start_3
    const-class v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    iput-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    :try_end_11
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_11} :catch_12

    .line 1305
    :goto_11
    return-void

    .line 1302
    :catch_12
    move-exception v0

    .line 1303
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    iput-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    goto :goto_11
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;

    .prologue
    .line 1291
    invoke-direct {p0, p1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 1295
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1296
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 1309
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 1310
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$SavedState;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1311
    return-void
.end method
