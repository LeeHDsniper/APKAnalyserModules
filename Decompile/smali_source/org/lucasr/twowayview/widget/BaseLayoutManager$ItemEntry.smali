.class public Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
.super Ljava/lang/Object;
.source "BaseLayoutManager.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/BaseLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ItemEntry"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public anchorLane:I

.field private spanMargins:[I

.field public startLane:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 114
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "startLane"    # I
    .param p2, "anchorLane"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->startLane:I

    .line 49
    iput p2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->anchorLane:I

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->startLane:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->anchorLane:I

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 57
    .local v1, "marginCount":I
    if-lez v1, :cond_27

    .line 58
    new-array v2, v1, [I

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    .line 59
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1a
    if-ge v0, v1, :cond_27

    .line 60
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aput v3, v2, v0

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 63
    .end local v0    # "i":I
    :cond_27
    return-void
.end method

.method static synthetic access$000(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;)Z
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->hasSpanMargins()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;I)I
    .registers 3
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .param p1, "x1"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->getSpanMargin(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;III)V
    .registers 4
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->setSpanMargin(III)V

    return-void
.end method

.method private getSpanMargin(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    if-nez v0, :cond_6

    .line 100
    const/4 v0, 0x0

    .line 103
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    aget v0, v0, p1

    goto :goto_5
.end method

.method private hasSpanMargins()Z
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private setSpanMargin(III)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "margin"    # I
    .param p3, "span"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    if-nez v0, :cond_8

    .line 108
    new-array v0, p3, [I

    iput-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    .line 111
    :cond_8
    iget-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    aput p2, v0, p1

    .line 112
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method invalidateLane()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 89
    iput v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->startLane:I

    .line 90
    iput v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->anchorLane:I

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    .line 92
    return-void
.end method

.method setLane(Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;)V
    .registers 3
    .param p1, "laneInfo"    # Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;

    .prologue
    .line 84
    iget v0, p1, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    iput v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->startLane:I

    .line 85
    iget v0, p1, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    iput v0, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->anchorLane:I

    .line 86
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 72
    iget v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->startLane:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->anchorLane:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    if-eqz v2, :cond_21

    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    array-length v1, v2

    .line 76
    .local v1, "marginCount":I
    :goto_11
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-ge v0, v1, :cond_23

    .line 79
    iget-object v2, p0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->spanMargins:[I

    aget v2, v2, v0

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 75
    .end local v0    # "i":I
    .end local v1    # "marginCount":I
    :cond_21
    const/4 v1, 0x0

    goto :goto_11

    .line 81
    .restart local v0    # "i":I
    .restart local v1    # "marginCount":I
    :cond_23
    return-void
.end method
