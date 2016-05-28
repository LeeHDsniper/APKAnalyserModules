.class public final enum Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
.super Ljava/lang/Enum;
.source "TwoWayLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/TwoWayLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

.field public static final enum END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

.field public static final enum START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 50
    new-instance v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    const-string v1, "START"

    invoke-direct {v0, v1, v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .line 51
    new-instance v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    const-string v1, "END"

    invoke-direct {v0, v1, v3}, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    .line 49
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->START:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    aput-object v1, v0, v2

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->END:Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    aput-object v1, v0, v3

    sput-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->$VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

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
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 49
    const-class v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    return-object v0
.end method

.method public static values()[Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->$VALUES:[Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    invoke-virtual {v0}, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/lucasr/twowayview/TwoWayLayoutManager$Direction;

    return-object v0
.end method
