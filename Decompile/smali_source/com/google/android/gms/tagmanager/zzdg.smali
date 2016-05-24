.class public Lcom/google/android/gms/tagmanager/zzdg;
.super Lcom/google/android/gms/tagmanager/zzdd;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final zzaSW:Ljava/lang/String;

.field private static final zzaSX:Ljava/lang/String;

.field private static final zzaSY:Ljava/lang/String;

.field private static final zzaSZ:Ljava/lang/String;

.field private static final zzaTa:Ljava/lang/String;

.field private static final zzaTb:Ljava/lang/String;

.field private static final zzaTc:Ljava/lang/String;

.field private static final zzaTd:Ljava/lang/String;

.field private static final zzaTe:Ljava/lang/String;

.field private static final zzaTf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzaTg:Ljava/util/regex/Pattern;

.field private static final zzaTh:Ljava/util/regex/Pattern;

.field private static zzaTi:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static zzaTj:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

.field private final zzaTk:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaTl:Lcom/google/android/gms/tagmanager/zzdc;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzcE:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdl:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSW:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdv:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSX:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzeQ:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSY:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzeK:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSZ:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzeJ:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTa:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdu:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTb:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzhn:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTc:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzhq:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTd:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzhs:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTe:Ljava/lang/String;

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "detail"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "checkout"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "checkout_option"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "click"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "add"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "remove"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "purchase"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "refund"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTf:Ljava/util/List;

    const-string v0, "dimension(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTg:Ljava/util/regex/Pattern;

    const-string v0, "metric(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTh:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;)V
    .registers 4

    new-instance v0, Lcom/google/android/gms/tagmanager/zzdc;

    invoke-direct {v0, p1}, Lcom/google/android/gms/tagmanager/zzdc;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/tagmanager/zzdg;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzdc;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzdc;)V
    .registers 6

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzdd;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTl:Lcom/google/android/gms/tagmanager/zzdc;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTk:Ljava/util/Set;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTk:Ljava/util/Set;

    const-string v1, ""

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTk:Ljava/util/Set;

    const-string v1, "0"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTk:Ljava/util/Set;

    const-string v1, "false"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private zzO(Ljava/lang/Object;)Ljava/lang/Double;
    .registers 6

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_29

    :try_start_4
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-result-object p1

    :goto_a
    return-object p1

    :catch_b
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot convert the object to Double: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_29
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_38

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    goto :goto_a

    :cond_38
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_3f

    check-cast p1, Ljava/lang/Double;

    goto :goto_a

    :cond_3f
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot convert the object to Double: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private zzP(Ljava/lang/Object;)Ljava/lang/Integer;
    .registers 6

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_29

    :try_start_4
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-result-object p1

    :goto_a
    return-object p1

    :catch_b
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot convert the object to Integer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_29
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_38

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_a

    :cond_38
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_3f

    check-cast p1, Ljava/lang/Integer;

    goto :goto_a

    :cond_3f
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot convert the object to Integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private zzQ(Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/Promotion;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/analytics/ecommerce/Promotion;"
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/analytics/ecommerce/Promotion;

    invoke-direct {v1}, Lcom/google/android/gms/analytics/ecommerce/Promotion;-><init>()V

    const-string v0, "id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_16

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->setId(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;

    :cond_16
    const-string v0, "name"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_27

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->setName(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;

    :cond_27
    const-string v0, "creative"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_38

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->setCreative(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;

    :cond_38
    const-string v0, "position"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_49

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->setPosition(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;

    :cond_49
    return-object v1
.end method

.method private zzR(Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/Product;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/analytics/ecommerce/Product;"
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/analytics/ecommerce/Product;

    invoke-direct {v1}, Lcom/google/android/gms/analytics/ecommerce/Product;-><init>()V

    const-string v0, "id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setId(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_14
    const-string v0, "name"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setName(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_23
    const-string v0, "brand"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_32

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setBrand(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_32
    const-string v0, "category"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_41

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setCategory(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_41
    const-string v0, "variant"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_50

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setVariant(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_50
    const-string v0, "coupon"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5f

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setCouponCode(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_5f
    const-string v0, "position"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_72

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzP(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setPosition(I)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_72
    const-string v0, "price"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_85

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzO(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/analytics/ecommerce/Product;->setPrice(D)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_85
    const-string v0, "quantity"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_98

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzP(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setQuantity(I)Lcom/google/android/gms/analytics/ecommerce/Product;

    :cond_98
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a0
    :goto_a0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_123

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v3, Lcom/google/android/gms/tagmanager/zzdg;->zzaTg:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_e5

    const/4 v4, 0x1

    :try_start_b9
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_c0
    .catch Ljava/lang/NumberFormatException; {:try_start_b9 .. :try_end_c0} :catch_cd

    move-result v3

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setCustomDimension(ILjava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Product;

    goto :goto_a0

    :catch_cd
    move-exception v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "illegal number in custom dimension value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_a0

    :cond_e5
    sget-object v3, Lcom/google/android/gms/tagmanager/zzdg;->zzaTh:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_a0

    const/4 v4, 0x1

    :try_start_f2
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_f9
    .catch Ljava/lang/NumberFormatException; {:try_start_f2 .. :try_end_f9} :catch_10a

    move-result v3

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzP(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v3, v0}, Lcom/google/android/gms/analytics/ecommerce/Product;->setCustomMetric(II)Lcom/google/android/gms/analytics/ecommerce/Product;

    goto :goto_a0

    :catch_10a
    move-exception v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "illegal number in custom metric value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_a0

    :cond_123
    return-object v1
.end method

.method private zzS(Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTd:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_f

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzc(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTi:Ljava/util/Map;

    if-nez v0, :cond_44

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "transactionId"

    const-string v2, "&ti"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "transactionAffiliation"

    const-string v2, "&ta"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "transactionTax"

    const-string v2, "&tt"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "transactionShipping"

    const-string v2, "&ts"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "transactionTotal"

    const-string v2, "&tr"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "transactionCurrency"

    const-string v2, "&cu"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTi:Ljava/util/Map;

    :cond_44
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTi:Ljava/util/Map;

    goto :goto_e
.end method

.method private zzT(Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTe:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_f

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzc(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTj:Ljava/util/Map;

    if-nez v0, :cond_44

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "name"

    const-string v2, "&in"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "sku"

    const-string v2, "&ic"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "category"

    const-string v2, "&iv"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "price"

    const-string v2, "&ip"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "quantity"

    const-string v2, "&iq"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "currency"

    const-string v2, "&cu"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTj:Ljava/util/Map;

    :cond_44
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTj:Ljava/util/Map;

    goto :goto_e
.end method

.method private zza(Lcom/google/android/gms/analytics/Tracker;Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/Tracker;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)V"
        }
    .end annotation

    const-string v0, "transactionId"

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzfd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_e

    const-string v0, "Cannot find transactionId in data layer."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :cond_d
    :goto_d
    return-void

    :cond_e
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    :try_start_13
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTb:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzm(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v2

    const-string v0, "&t"

    const-string v1, "transaction"

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p2}, Lcom/google/android/gms/tagmanager/zzdg;->zzS(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_32
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzfd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v2, v1, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzd(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_51} :catch_52

    goto :goto_32

    :catch_52
    move-exception v0

    const-string v1, "Unable to send transaction"

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_d

    :cond_59
    :try_start_59
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v0, "transactionProducts"

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzfe(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_ca

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_68
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ca

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "name"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_82

    const-string v0, "Unable to send transaction item hit due to missing \'name\' field."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_d

    :cond_82
    sget-object v1, Lcom/google/android/gms/tagmanager/zzdg;->zzaTb:Ljava/lang/String;

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzm(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v6

    const-string v1, "&t"

    const-string v2, "item"

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "&ti"

    invoke-interface {v6, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p2}, Lcom/google/android/gms/tagmanager/zzdg;->zzT(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_a6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v6, v2, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzd(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a6

    :cond_c6
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_68

    :cond_ca
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_ce
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V
    :try_end_dd
    .catch Ljava/lang/IllegalArgumentException; {:try_start_59 .. :try_end_dd} :catch_52

    goto :goto_ce
.end method

.method private zzb(Lcom/google/android/gms/analytics/Tracker;Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/Tracker;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    new-instance v3, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;

    invoke-direct {v3}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;-><init>()V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTb:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzm(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->setAll(Ljava/util/Map;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSZ:Ljava/lang/String;

    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzj(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8f

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    const-string v2, "ecommerce"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/tagmanager/DataLayer;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_1ca

    check-cast v0, Ljava/util/Map;

    :goto_2b
    move-object v2, v0

    :goto_2c
    if-eqz v2, :cond_199

    const-string v0, "&cu"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_40

    const-string v0, "currencyCode"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_40
    if-eqz v0, :cond_47

    const-string v4, "&cu"

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;

    :cond_47
    const-string v0, "impressions"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v4, v0, Ljava/util/List;

    if-eqz v4, :cond_a3

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_57
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    :try_start_63
    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzR(Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/Product;

    move-result-object v5

    const-string v6, "list"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v5, v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->addImpression(Lcom/google/android/gms/analytics/ecommerce/Product;Ljava/lang/String;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;
    :try_end_72
    .catch Ljava/lang/RuntimeException; {:try_start_63 .. :try_end_72} :catch_73

    goto :goto_57

    :catch_73
    move-exception v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to extract a product from DataLayer. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_57

    :cond_8f
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTa:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_1c7

    check-cast v0, Ljava/util/Map;

    move-object v2, v0

    goto :goto_2c

    :cond_a3
    const-string v0, "promoClick"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f2

    const-string v0, "promoClick"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "promotions"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    :goto_bb
    const/4 v1, 0x1

    if-eqz v0, :cond_180

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    :try_start_ce
    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzQ(Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/Promotion;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->addPromotion(Lcom/google/android/gms/analytics/ecommerce/Promotion;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;
    :try_end_d5
    .catch Ljava/lang/RuntimeException; {:try_start_ce .. :try_end_d5} :catch_d6

    goto :goto_c2

    :catch_d6
    move-exception v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to extract a promotion from DataLayer. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_c2

    :cond_f2
    const-string v0, "promoView"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c4

    const-string v0, "promoView"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "promotions"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_bb

    :cond_10b
    const-string v0, "promoClick"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_179

    const-string v0, "&promoa"

    const-string v1, "click"

    invoke-virtual {v3, v0, v1}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;

    const/4 v0, 0x0

    :goto_11b
    if-eqz v0, :cond_199

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTf:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_123
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_199

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_123

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string v2, "products"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_182

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_149
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_182

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    :try_start_155
    invoke-direct {p0, v2}, Lcom/google/android/gms/tagmanager/zzdg;->zzR(Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/Product;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->addProduct(Lcom/google/android/gms/analytics/ecommerce/Product;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;
    :try_end_15c
    .catch Ljava/lang/RuntimeException; {:try_start_155 .. :try_end_15c} :catch_15d

    goto :goto_149

    :catch_15d
    move-exception v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to extract a product from DataLayer. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_149

    :cond_179
    const-string v0, "&promoa"

    const-string v4, "view"

    invoke-virtual {v3, v0, v4}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;

    :cond_180
    move v0, v1

    goto :goto_11b

    :cond_182
    :try_start_182
    const-string v2, "actionField"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a1

    const-string v2, "actionField"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zze(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    move-result-object v0

    :goto_196
    invoke-virtual {v3, v0}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->setProductAction(Lcom/google/android/gms/analytics/ecommerce/ProductAction;)Lcom/google/android/gms/analytics/HitBuilders$HitBuilder;
    :try_end_199
    .catch Ljava/lang/RuntimeException; {:try_start_182 .. :try_end_199} :catch_1a8

    :cond_199
    :goto_199
    invoke-virtual {v3}, Lcom/google/android/gms/analytics/HitBuilders$ScreenViewBuilder;->build()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V

    return-void

    :cond_1a1
    :try_start_1a1
    new-instance v1, Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    invoke-direct {v1, v0}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;-><init>(Ljava/lang/String;)V
    :try_end_1a6
    .catch Ljava/lang/RuntimeException; {:try_start_1a1 .. :try_end_1a6} :catch_1a8

    move-object v0, v1

    goto :goto_196

    :catch_1a8
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to extract a product action from DataLayer. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    goto :goto_199

    :cond_1c4
    move-object v0, v1

    goto/16 :goto_bb

    :cond_1c7
    move-object v2, v1

    goto/16 :goto_2c

    :cond_1ca
    move-object v0, v1

    goto/16 :goto_2b
.end method

.method private zzc(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/Map;

    if-nez v1, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    check-cast v0, Ljava/util/Map;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_39

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    :cond_39
    move-object v0, v1

    goto :goto_9
.end method

.method private zzd(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p3, :cond_5

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-void
.end method

.method private zze(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/analytics/ecommerce/ProductAction;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    invoke-direct {v0, p1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;-><init>(Ljava/lang/String;)V

    const-string v1, "id"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_14

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionId(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_14
    const-string v1, "affiliation"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionAffiliation(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_23
    const-string v1, "coupon"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_32

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionCouponCode(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_32
    const-string v1, "list"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_41

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setProductActionList(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_41
    const-string v1, "option"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_50

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setCheckoutOptions(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_50
    const-string v1, "revenue"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_63

    invoke-direct {p0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzO(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionRevenue(D)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_63
    const-string v1, "tax"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_76

    invoke-direct {p0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzO(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionTax(D)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_76
    const-string v1, "shipping"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_89

    invoke-direct {p0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzO(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setTransactionShipping(D)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_89
    const-string v1, "step"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_9c

    invoke-direct {p0, v1}, Lcom/google/android/gms/tagmanager/zzdg;->zzP(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/ecommerce/ProductAction;->setCheckoutStep(I)Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_9c
    return-object v0
.end method

.method private zzfd(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/DataLayer;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method private zzfe(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaOT:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/DataLayer;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    instance-of v0, v1, Ljava/util/List;

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "transactionProducts should be of type List."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    move-object v0, v1

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/util/Map;

    if-nez v2, :cond_1d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Each element of transactionProducts should be of type Map."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_33
    check-cast v1, Ljava/util/List;

    goto :goto_9
.end method

.method private zzj(Ljava/util/Map;Ljava/lang/String;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return v0

    :cond_a
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzk(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_9
.end method

.method private zzm(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_8

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_7
    return-object v0

    :cond_8
    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzdg;->zzc(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v1

    if-nez v1, :cond_14

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_7

    :cond_14
    const-string v0, "&aip"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_2f

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTk:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    const-string v0, "&aip"

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2f
    move-object v0, v1

    goto :goto_7
.end method


# virtual methods
.method public bridge synthetic zzAc()Ljava/lang/String;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzdd;->zzAc()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzAd()Ljava/util/Set;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzdd;->zzAd()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 3

    invoke-super {p0, p1}, Lcom/google/android/gms/tagmanager/zzdd;->zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    return-object v0
.end method

.method public zzI(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTl:Lcom/google/android/gms/tagmanager/zzdc;

    const-string v1, "_GTM_DEFAULT_TRACKER_"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzdc;->zzeV(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;

    move-result-object v1

    const-string v0, "collect_adid"

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzj(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/Tracker;->enableAdvertisingIdCollection(Z)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSY:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzj(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-direct {p0, v1, p1}, Lcom/google/android/gms/tagmanager/zzdg;->zzb(Lcom/google/android/gms/analytics/Tracker;Ljava/util/Map;)V

    :goto_1c
    return-void

    :cond_1d
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaSX:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzj(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_35

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTb:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzm(Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/Tracker;->send(Ljava/util/Map;)V

    goto :goto_1c

    :cond_35
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdg;->zzaTc:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/tagmanager/zzdg;->zzj(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-direct {p0, v1, p1}, Lcom/google/android/gms/tagmanager/zzdg;->zza(Lcom/google/android/gms/analytics/Tracker;Ljava/util/Map;)V

    goto :goto_1c

    :cond_41
    const-string v0, "Ignoring unknown tag."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_1c
.end method

.method public bridge synthetic zzzx()Z
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzdd;->zzzx()Z

    move-result v0

    return v0
.end method
