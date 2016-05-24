.class Lcom/google/android/gms/tagmanager/zzay;
.super Lcom/google/android/gms/tagmanager/zzak;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzay$1;,
        Lcom/google/android/gms/tagmanager/zzay$zza;
    }
.end annotation


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final zzaPY:Ljava/lang/String;

.field private static final zzaQq:Ljava/lang/String;

.field private static final zzaQr:Ljava/lang/String;

.field private static final zzaQs:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzbP:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzay;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzdz:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzay;->zzaPY:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfx:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzay;->zzaQq:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfB:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzay;->zzaQr:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzeU:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzay;->zzaQs:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    sget-object v0, Lcom/google/android/gms/tagmanager/zzay;->ID:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/tagmanager/zzay;->zzaPY:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private zza(Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzay$zza;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Character;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/tagmanager/zzay$1;->zzaQt:[I

    invoke-virtual {p2}, Lcom/google/android/gms/tagmanager/zzay$zza;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_50

    :goto_b
    return-object p1

    :pswitch_c
    :try_start_c
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdj;->zzff(Ljava/lang/String;)Ljava/lang/String;
    :try_end_f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_c .. :try_end_f} :catch_11

    move-result-object p1

    goto :goto_b

    :catch_11
    move-exception v0

    const-string v1, "Joiner: unsupported encoding"

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b

    :pswitch_18
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_25
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\\"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_25

    :cond_4e
    move-object p1, v1

    goto :goto_b

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_c
        :pswitch_18
    .end packed-switch
.end method

.method private zza(Ljava/lang/StringBuilder;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzay$zza;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Character;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p2, p3, p4}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private zza(Ljava/util/Set;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Character;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_15

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_15
    return-void
.end method


# virtual methods
.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)",
            "Lcom/google/android/gms/internal/zzag$zza;"
        }
    .end annotation

    const/4 v6, 0x0

    sget-object v0, Lcom/google/android/gms/tagmanager/zzay;->zzaPY:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    if-nez v0, :cond_10

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    :goto_f
    return-object v0

    :cond_10
    sget-object v1, Lcom/google/android/gms/tagmanager/zzay;->zzaQq:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v1, :cond_66

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    :goto_1f
    sget-object v1, Lcom/google/android/gms/tagmanager/zzay;->zzaQr:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v1, :cond_6a

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v1

    move-object v3, v1

    :goto_2e
    sget-object v5, Lcom/google/android/gms/tagmanager/zzay$zza;->zzaQu:Lcom/google/android/gms/tagmanager/zzay$zza;

    sget-object v1, Lcom/google/android/gms/tagmanager/zzay;->zzaQs:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzag$zza;

    const/4 v4, 0x0

    if-eqz v1, :cond_e9

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "url"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6e

    sget-object v1, Lcom/google/android/gms/tagmanager/zzay$zza;->zzaQv:Lcom/google/android/gms/tagmanager/zzay$zza;

    move-object v10, v4

    move-object v4, v1

    move-object v1, v10

    :goto_4c
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, v0, Lcom/google/android/gms/internal/zzag$zza;->type:I

    packed-switch v5, :pswitch_data_ee

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v7, v0, v4, v1}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)V

    :cond_5d
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_f

    :cond_66
    const-string v1, ""

    move-object v2, v1

    goto :goto_1f

    :cond_6a
    const-string v1, "="

    move-object v3, v1

    goto :goto_2e

    :cond_6e
    const-string v4, "backslash"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8d

    sget-object v4, Lcom/google/android/gms/tagmanager/zzay$zza;->zzaQw:Lcom/google/android/gms/tagmanager/zzay$zza;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p0, v1, v2}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/util/Set;Ljava/lang/String;)V

    invoke-direct {p0, v1, v3}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/util/Set;Ljava/lang/String;)V

    const/16 v5, 0x5c

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_4c

    :cond_8d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Joiner: unsupported escape type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto/16 :goto_f

    :pswitch_a9
    const/4 v3, 0x1

    iget-object v5, v0, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v8, v5

    move v0, v6

    :goto_ae
    if-ge v0, v8, :cond_5d

    aget-object v9, v5, v0

    if-nez v3, :cond_b7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b7
    invoke-static {v9}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v7, v3, v4, v1}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)V

    add-int/lit8 v0, v0, 0x1

    move v3, v6

    goto :goto_ae

    :pswitch_c2
    move v5, v6

    :goto_c3
    iget-object v6, v0, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v6, v6

    if-ge v5, v6, :cond_5d

    if-lez v5, :cond_cd

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_cd
    iget-object v6, v0, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    aget-object v6, v6, v5

    invoke-static {v6}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v6

    iget-object v8, v0, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    aget-object v8, v8, v5

    invoke-static {v8}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v6, v4, v1}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, v7, v8, v4, v1}, Lcom/google/android/gms/tagmanager/zzay;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzay$zza;Ljava/util/Set;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_c3

    :cond_e9
    move-object v1, v4

    move-object v4, v5

    goto/16 :goto_4c

    nop

    :pswitch_data_ee
    .packed-switch 0x2
        :pswitch_a9
        :pswitch_c2
    .end packed-switch
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
