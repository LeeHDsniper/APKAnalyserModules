.class public final enum Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
.super Ljava/lang/Enum;
.source "TwoWayLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/TwoWayLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Orientation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

.field public static final enum HORIZONTAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

.field public static final enum VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 45
    new-instance v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    const-string v1, "HORIZONTAL"

    invoke-direct {v0, v1, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->HORIZONTAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .line 46
    new-instance v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    const-string v1, "VERTICAL"

    invoke-direct {v0, v1, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .line 44
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->HORIZONTAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    aput-object v1, v0, v3

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->$VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

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
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    const-class v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    return-object v0
.end method

.method public static values()[Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->$VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    invoke-virtual {v0}, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    return-object v0
.end method
