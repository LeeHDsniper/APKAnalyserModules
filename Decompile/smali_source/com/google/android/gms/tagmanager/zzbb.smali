.class public Lcom/google/android/gms/tagmanager/zzbb;
.super Lcom/google/android/gms/tagmanager/zzak;


# static fields
.field private static final ID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzby:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzbb;->ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    sget-object v0, Lcom/google/android/gms/tagmanager/zzbb;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzak;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic zzAc()Ljava/lang/String;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzak;->zzAc()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzAd()Ljava/util/Set;
    .registers 2

    invoke-super {p0}, Lcom/google/android/gms/tagmanager/zzak;->zzAd()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public zzG(Ljava/util/Map;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 3
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

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    if-nez v0, :cond_b

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_16

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdf;->zzBg()Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_a

    :cond_16
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    goto :goto_a
.end method

.method public zzzx()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
