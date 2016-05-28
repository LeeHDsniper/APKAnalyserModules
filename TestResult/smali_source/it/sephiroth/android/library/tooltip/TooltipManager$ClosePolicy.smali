.class public final enum Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;
.super Ljava/lang/Enum;
.source "TooltipManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ClosePolicy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field public static final enum None:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field public static final enum TouchInside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field public static final enum TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field public static final enum TouchOutside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field public static final enum TouchOutsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 389
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-string v1, "TouchInside"

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 396
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-string v1, "TouchInsideExclusive"

    invoke-direct {v0, v1, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 402
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-string v1, "TouchOutside"

    invoke-direct {v0, v1, v4}, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 408
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-string v1, "TouchOutsideExclusive"

    invoke-direct {v0, v1, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 412
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-string v1, "None"

    invoke-direct {v0, v1, v6}, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->None:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 384
    const/4 v0, 0x5

    new-array v0, v0, [Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    aput-object v1, v0, v2

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchInsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutside:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    aput-object v1, v0, v4

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->TouchOutsideExclusive:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    aput-object v1, v0, v5

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->None:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    aput-object v1, v0, v6

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->$VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

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
    .line 384
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 384
    const-class v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;
    .registers 1

    .prologue
    .line 384
    sget-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->$VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    return-object v0
.end method
