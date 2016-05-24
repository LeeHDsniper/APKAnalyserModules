.class Lcom/google/android/gms/tagmanager/zzcf;
.super Lcom/google/android/gms/tagmanager/zzcz;


# static fields
.field private static final ID:Ljava/lang/String;

.field private static final zzaRk:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/google/android/gms/internal/zzad;->zzce:Lcom/google/android/gms/internal/zzad;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzad;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcf;->ID:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzae;->zzfr:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcf;->zzaRk:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcf;->ID:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzcz;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;)Z"
        }
    .end annotation

    const/16 v1, 0x40

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcf;->zzaRk:Ljava/lang/String;

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzk(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_26

    const/16 v0, 0x42

    :goto_16
    :try_start_16
    invoke-static {p2, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z
    :try_end_21
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_16 .. :try_end_21} :catch_23

    move-result v0

    :goto_22
    return v0

    :catch_23
    move-exception v0

    const/4 v0, 0x0

    goto :goto_22

    :cond_26
    move v0, v1

    goto :goto_16
.end method
